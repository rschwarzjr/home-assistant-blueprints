#!/usr/bin/env ruby
# frozen_string_literal: true

require "psych"

class BlueprintTreeBuilder < Psych::TreeBuilder
  def scalar(value, anchor, tag, plain, quoted, style)
    tag = nil if tag == "!input"
    super(value, anchor, tag, plain, quoted, style)
  end
end

def load_blueprint(path)
  parser = Psych::Parser.new(BlueprintTreeBuilder.new)
  parser.parse(File.read(path, encoding: "UTF-8"))
  parser.handler.root.to_ruby.first
end

paths = ARGV.empty? ? Dir.glob("blueprints/automation/**/*.yaml").sort : ARGV

if paths.empty?
  warn "No blueprint YAML files found"
  exit 1
end

def each_hash(value, &block)
  case value
  when Hash
    yield value
    value.each_value { |child| each_hash(child, &block) }
  when Array
    value.each { |child| each_hash(child, &block) }
  end
end

paths.each do |path|
  document = load_blueprint(path)

  unless document.is_a?(Hash) && document.dig("blueprint", "domain") == "automation"
    warn "Blueprint schema check failed: #{path}"
    exit 1
  end

  if document.dig("blueprint")&.key?("min_version")
    warn "Invalid blueprint schema in #{path}: put 'min_version' under 'blueprint.homeassistant'"
    exit 1
  end

  missing_keys = []
  missing_keys << "trigger(s)" unless document.key?("trigger") || document.key?("triggers")
  missing_keys << "action(s)" unless document.key?("action") || document.key?("actions")
  unless missing_keys.empty?
    warn "Missing automation keys in #{path}: #{missing_keys.join(', ')}"
    exit 1
  end

  each_hash(document) do |node|
    next unless node["condition"] == "state" && node.key?("for") && node["state"].is_a?(Array)

    warn "Invalid state condition in #{path}: 'for' cannot be combined with a list of states"
    exit 1
  end

  puts "YAML OK: #{path}"
end

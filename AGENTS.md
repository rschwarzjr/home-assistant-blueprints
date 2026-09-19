# Home Assistant Blueprints

## Project scope

- This repository contains reusable Home Assistant automation blueprints.
- Keep canonical blueprints under `blueprints/automation/<name>/`.
- Do not commit credentials, access tokens, private URLs, or installation-specific entity IDs.

## Working agreements

- Preserve compatibility with existing blueprint imports and saved user inputs.
- Keep changes focused on the requested automation or project tooling.
- Prefer explicit Home Assistant YAML over unnecessary templates or abstractions.
- Follow the naming and structure already used by the blueprint being changed.
- Explain behavior changes and any migration considerations in the final response.

## Validation

- Run `yamllint` on modified YAML files when it is available.
- Run `ruby tools/validate_blueprint.rb <blueprint-path>` for modified blueprints.
- Run `ruby tools/validate_blueprint.rb` to validate all automation blueprints.
- Review the Git diff before committing or opening a pull request.

## Git workflow

- Keep `main` as the stable baseline.
- Use a dedicated worktree and branch for each implementation task.
- Use focused commits and merge completed work through pull requests.

## Code review rules

- Flag changes that rename or remove existing blueprint inputs without a migration path.
- Flag state conditions that combine a list of states with `for`, which Home Assistant rejects.
- Flag committed secrets, tokens, private URLs, and installation-specific entity IDs.

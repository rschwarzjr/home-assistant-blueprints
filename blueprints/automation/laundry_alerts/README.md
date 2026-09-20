# Laundry Done Alerts

This Home Assistant blueprint sends alerts when either the **washer** or **dryer** finishes.

- **Triggers:** The selected washer or dryer status sensor enters its configured running state.

- **Actions:** Alexa announcements and optional Mobile App push notifications after the
  appliance reaches a configured finish state.

## Inputs

- **Alexa targets**: One or more Alexa `media_player` entities.
- **Send phone push notification?**: Toggle to also notify a phone.
- **Phone (Mobile App device)**: Pick the phone that should receive push notifications.
- **Legacy notify service**: Existing automations may keep a manual service such as
  `notify.mobile_app_your_phone`; new configurations should leave it blank.
- **Announcement Title**: Title for Alexa/phone notifications.
- **Washer Message**: Spoken message when washer finishes.
- **Dryer Message**: Spoken message when dryer finishes.
- **Alexa Method**: `announce` (tone + announcement) or `speak` (TTS only).

## Requirements

- [Alexa Media Player integration](https://github.com/custom-components/alexa_media_player)
- [Home Assistant Mobile App](https://companion.home-assistant.io/) for push notifications

## Usage

1. Import the blueprint in Home Assistant.
2. Configure the inputs (Alexa device(s), phone, messages).
3. Save the automation.
4. Test by running an appliance or changing a test status sensor through the configured
   running and finish states.

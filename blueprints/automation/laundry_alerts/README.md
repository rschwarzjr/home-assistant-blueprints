# Laundry Done Alerts (v1.0)

This Home Assistant blueprint sends alerts when either the **washer** or **dryer** finishes.

- **Triggers:**  
  - `event.washer_notification`  
  - `event.dryer_notification`  

- **Actions:**  
  - Alexa announcement(s) on selected devices.  
  - (Optional) Mobile App push notification to a selected phone.  

## Inputs

- **Alexa targets**: One or more Alexa `media_player` entities.  
- **Send phone push notification?**: Toggle to also notify a phone.  
- **Phone (Mobile App device)**: Pick your phone device.  
- **Override notify service**: If auto-detection fails, enter your service manually (e.g., `notify.mobile_app_roberts_iphone`).  
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
3. Save automation.  
4. Test by manually firing `event.washer_notification` or `event.dryer_notification` from Developer Tools → Events.  

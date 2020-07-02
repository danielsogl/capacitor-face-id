# Capacitor Face ID Plugin

[![npm version](https://badge.fury.io/js/capacitor-face-id.svg)](https://badge.fury.io/js/capacitor-face-id)
![Build](https://github.com/danielsogl/capacitor-face-id/workflows/Build/badge.svg)

Allow users to authenticate with Face ID or Touch ID on iOS devices.

![Logo](https://www.intego.com/mac-security-blog/wp-content/uploads/2017/10/Touch-ID-vs-Face-ID.png)

#### BREAKING CHANGE
Prior to v2.1.0, `isAvailable()` returned `"TouchID"` or `"FaceID"` if either was
available. Starting with v2.1.0, `"Touch ID"` or `"Face ID"` is returned, since
those are the official names you want to show to your users. This change removes the
necessity to map the returned value to the user-facing name.

## Installation

```sh
npm install capacitor-face-id
```

## Setup

On iOS, you must add an entry to your target’s `Info.plist`:

1. Go to the settings for your app’s target (not the project) in Xcode.
1. Click on the `Info` tab.
1. Add a property to the properties list.
1. Select `Privacy - Face ID Usage Description` as the key.
1. Set the value to the prompt you want to show to the user the first
time a Face/Touch ID authorization is attempted. Example:

```
Access to the app requires authentication.
```

## Usage

```ts
import { Plugins, PluginResultError } from '@capacitor/core';
import { FaceIDPluginErrorCode } from 'capacitor-face-id';

const { FaceId } = Plugins;
const appName = 'My Great App';

async function biometricAuth() {
  const authCheck = await FaceId.isAvailable();
  const authType = authCheck.value;

  if (authType !== 'None') {
    try {
      await FaceId.auth({
        reason: 'Please authenticate',
        fallbackTitle: ''
      });
    } catch (error) {
      let message;
  
      switch (error.code) {
        // This happens if the user disables biometric access in Settings
        case FaceIDPluginErrorCode.biometryNotAvailable:
          message = `In order to use ${authType}, you must enable it in Settings > ${appName}.`;
          break;
  
        case FaceIDPluginErrorCode.biometryNotEnrolled:
          message = `In order to use ${authType}, you must set it up in the Settings app.`;
          break;
  
        default:
          message = 'Feel free to try again.';
      }
  
      await showAlert({
        header: `${authType} Error`,
        message: `${error.message} ${message}`
      });
    }
  } else {
    // use fallback authentication here
  }
}
```

## API

The complete API is documented [here](./docs/index.html).

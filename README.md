# Layoutry

<p align="center">
 <br>
 <img width="400" src="https://user-images.githubusercontent.com/59066341/211650854-e7350bd8-aba9-430b-a216-057c126e7354.svg" alt="Package Logo">
 <br>
 <br>
 <a href="https://pub.dev/packages/layoutry">
  <img src="https://img.shields.io/pub/v/layoutry?color=blue" alt="pub version" />
 </a>
  <a href="https://github.com/insolite-dev/layoutry/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/License-MIT-red.svg"
      alt="License: MIT" />
  </a>
 <br>
  <a href="https://discord.gg/CtStkzrHV3">
    <img src="https://img.shields.io/discord/914899238415130714?color=blue&label=Insolite Community&logo=discord"
      alt="Insolite Community Discord Invite Link" />
  </a>   
</p>

## Installing
**See the official installing guidline from [layoutry/install](https://pub.dev/packages/layoutry/install)**

## Usage & Overview

<img width="1000" src="https://user-images.githubusercontent.com/59066341/211651068-27f5ca62-4d0d-44fa-b87d-7924605c017c.gif" alt="Package Example Overview">

Layoutry is a modified implementation of the **LayoutBuilder**, so that we can use its **LayoutInfo** to easily catch the device's type via its screen size.
Where the **LayoutDevice** is a custom `Platform.operatingSystem` implementation `enum`, which used to mark current device's type by screen size.

Here is the code:
```dart
Layoutry(
  builder: (context, info) {
    // A manual defined layout-device to color map.
    final colors = <LayoutDevice, Color>{
      LayoutDevice.mobile: Colors.blue,
      LayoutDevice.tablet: Colors.red,
      LayoutDevice.web: Colors.green,
    };

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      // color will be generated from [colors],
      // by listening to device's screen size.
      color: colors[info.device],
      child: Center(child: Builder(builder: (context) {
        // If the device's screen size is like mobile:
        // "Hi Mobile" will written in the screen.
        if (info.device.isMobile()) {
          return const Text(
            'Hi Mobile',
            style: TextStyle(color: Colors.white, fontSize: 20),
          );
        }

        // If the device's screen size is like web:
        // "Hi Web" will written in the screen.
        if (info.device.isWeb()) {
          return const Text(
            'Hi Web',
            style: TextStyle(color: Colors.white, fontSize: 20),
          );
        }

        // In other cases: Hi current device's screen size
        // appropriate device type will be written in the screen.
        return Text(
          'Hi ${info.device.toString()}',
          style: const TextStyle(color: Colors.white, fontSize: 20),
        );
      })),
    );
  },
)
```

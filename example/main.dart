import 'package:flutter/material.dart';
import 'package:layoutry/layoutry.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(home: Home());
}

// See overview at:
// https://user-images.githubusercontent.com/59066341/211651068-27f5ca62-4d0d-44fa-b87d-7924605c017c.gif
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layoutry(
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
      ),
    );
  }
}

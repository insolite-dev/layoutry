//
// Copyright 2023 present Insolite. All rights reserved.
// Use of this source code is governed by MIT license
// that can be found in the LICENSE file.
//

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layoutry/layout_info.dart';

void main() {
  group('LayoutDeviceExtension:', () {
    test('isMobile', () {
      final tests = <LayoutDevice, bool>{
        LayoutDevice.mobile: true,
        LayoutDevice.tablet: false,
        LayoutDevice.web: false,
        LayoutDevice.webHD: false,
      };

      tests.forEach((t, expected) => expect(t.isMobile(), expected));
    });

    test('isTablet', () {
      final tests = <LayoutDevice, bool>{
        LayoutDevice.mobile: false,
        LayoutDevice.tablet: true,
        LayoutDevice.web: false,
        LayoutDevice.webHD: false,
      };

      tests.forEach((t, expected) => expect(t.isTablet(), expected));
    });

    test('isWeb', () {
      final tests = <LayoutDevice, bool>{
        LayoutDevice.mobile: false,
        LayoutDevice.tablet: false,
        LayoutDevice.web: true,
        LayoutDevice.webHD: false,
      };

      tests.forEach((t, expected) => expect(t.isWeb(), expected));
    });

    test('isWebHD', () {
      final tests = <LayoutDevice, bool>{
        LayoutDevice.mobile: false,
        LayoutDevice.tablet: false,
        LayoutDevice.web: false,
        LayoutDevice.webHD: true,
      };

      tests.forEach((t, expected) => expect(t.isWebHD(), expected));
    });
  });

  group('LayoutInfo:', () {
    test('buildFromConstraints', () {
      final tests = <BoxConstraints, LayoutInfo>{
        const BoxConstraints(maxWidth: 200): const LayoutInfo(
          device: LayoutDevice.mobile,
          constraints: BoxConstraints(maxWidth: 200),
        ),
        const BoxConstraints(maxWidth: 1200): const LayoutInfo(
          device: LayoutDevice.tablet,
          constraints: BoxConstraints(maxWidth: 1200),
        ),
        const BoxConstraints(maxWidth: 1925): const LayoutInfo(
          device: LayoutDevice.web,
          constraints: BoxConstraints(maxWidth: 1925),
        ),
        const BoxConstraints(maxWidth: 100000): const LayoutInfo(
          device: LayoutDevice.webHD,
          constraints: BoxConstraints(maxWidth: 100000),
        ),
      };

      tests.forEach((t, expected) {
        final got = LayoutInfo.buildFromConstraints(t);

        expect(got.device, expected.device);
        expect(got.constraints, expected.constraints);
      });
    });

    test('deviceFromWeight', () {
      final tests = <int, LayoutDevice>{
        800: LayoutDevice.mobile,
        1200: LayoutDevice.tablet,
        1600: LayoutDevice.web,
        1925: LayoutDevice.web,
        100000: LayoutDevice.webHD,
      };

      tests.forEach(
        (t, expected) => expect(
          LayoutInfo.deviceFromWeight(t.toDouble()),
          expected,
        ),
      );
    });
  });
}

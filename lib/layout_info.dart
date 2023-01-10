//
// Copyright 2023 present Insolite. All rights reserved.
// Use of this source code is governed by MIT license
// that can be found in the LICENSE file.
//

import 'package:flutter/material.dart';

// TODO: Has to be re-calculated ~ exact ~ widths.
const int widthMobile = 800;
const int widthTablet = 1200;
const int widthFloatingWindow = 1600;
const int widthFullHD = 1925;
const int widthFullHDPlus = 100000;

/// A device type by its screen size.
///
/// Similar to `Platform.operatingSystem` from `dart:io`.
enum LayoutDevice { mobile, tablet, web, webHD } // TODO: should remove webHD.

extension LayoutDeviceExtension on LayoutDevice {
  bool isMobile() => this == LayoutDevice.mobile;
  bool isTablet() => this == LayoutDevice.tablet;
  bool isWeb() => this == LayoutDevice.web;
  bool isWebHD() => this == LayoutDevice.webHD;
}

/// A main class of information of [Layoutry].
/// Includes the default [BoxConstraints] (of the [LayoutBuilder]), and [LayoutDevice].
class LayoutInfo {
  final BoxConstraints constraints;
  final LayoutDevice device;

  const LayoutInfo({required this.constraints, required this.device});

  /// Generates [LayoutInfo] from the [BoxConstraints] of the [LayoutBuilder].
  /// Uses [deviceByWeigth] to catch the right [LayoutDevice] by `maxWidth`.
  static LayoutInfo buildFromConstraints(BoxConstraints c) {
    final width = c.maxWidth;
    return LayoutInfo(constraints: c, device: deviceFromWeight(width));
  }

  /// Generates a [LayoutDevice] by [maxWidth] of [BoxConstraints].
  // TODO: withFloatingWindow shouldn't return [LayoutDevice.web].
  static LayoutDevice deviceFromWeight(double w) {
    if (w <= widthMobile) return LayoutDevice.mobile;
    if (w <= widthTablet) return LayoutDevice.tablet;
    if (w <= widthFullHD || w <= widthFloatingWindow) {
      return LayoutDevice.web;
    }

    if (w <= widthFullHDPlus) return LayoutDevice.webHD;

    // Could be any.
    return LayoutDevice.mobile;
  }
}

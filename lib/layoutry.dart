//
// Copyright 2023 present Insolite. All rights reserved.
// Use of this source code is governed by MIT license
// that can be found in the LICENSE file.
//

library layoutry;

import 'package:flutter/material.dart';
import 'package:layoutry/layout_info.dart';

export 'layout_info.dart';

/// A builder type definition for the [Layoutry].
/// Requires a [BuildContext] and [LayoutInfo].
typedef LayoutryBuilder = Widget Function(
  BuildContext context,
  LayoutInfo info,
);

/// Layoutry is a modified [LayoutBuilder], which comes with a parsed [LayoutInfo].
/// Where you can use this info to check the device type of current running screen.
///
/// For example:
/// ```dart
///  Layoutry(builder: (context, info) {
///    if(info.device.isMobile()) {
///      return Text('Hi Mobile')
///    }
///
///    if(info.device.isWeb()) {
///      return Text('Hi Web');
///    }
///
///    return Text('Hi ${info.device.toString()}');
///  });
/// ```
class Layoutry extends StatelessWidget {
  final LayoutryBuilder builder;
  const Layoutry({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => builder(
        context,
        LayoutInfo.buildFromConstraints(constraints),
      ),
    );
  }
}

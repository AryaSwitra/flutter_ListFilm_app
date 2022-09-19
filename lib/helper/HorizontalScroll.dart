import 'dart:ui';

import 'package:flutter/material.dart';

class MyCustomeScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevice => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

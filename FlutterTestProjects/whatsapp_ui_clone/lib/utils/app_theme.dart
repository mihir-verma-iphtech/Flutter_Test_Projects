import 'package:flutter/material.dart';

import 'color_scheme.dart';

AppBarTheme appBarTheme() => AppBarTheme(
      color: AppColorScheme.appbarColor,
      foregroundColor: AppColorScheme.appGreyColor,
      actionsIconTheme: const IconThemeData(
        size: 23,
      ),
    );

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

bool get isDesktopPlatform =>
    !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);

const double kDesktopContentWidth = double.infinity;

const double kTabletShortestSide = 600;

bool useClientLayout(BuildContext context) =>
    isDesktopPlatform ||
    MediaQuery.sizeOf(context).shortestSide >= kTabletShortestSide;

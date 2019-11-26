import 'package:flutter/widgets.dart';

class LocalKeys {
  static final myBikeItem = (int id) => Key('MyBikeItem__$id');
  static final brandField = const Key('__brandField__');
  static final regField = const Key('__regField__');
  static final wheelField = const Key('__wheelField__');
  static final headlightField = const Key('__headlightField__');
  static final modelField = const Key('__modelField__');
  static final suspensionField = const Key('__suspensionField__');
  static final mirrorField = const Key('__mirrorField__');
}
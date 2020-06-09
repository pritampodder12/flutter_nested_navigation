import 'dart:async' show Completer, Future;
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' show TabController, kTabScrollDuration;

// Note that the overridden `animateTo` method always returns
// a `Future<AnimationStatus>` with `AnimationStatus.completed`,
// even if there was no animation to do.
//
// This is important when chaining together animations, as it
// makes the logic simpler with fewer conditionals needed.
class TabControllerForSequencedAnimations extends TabController {
  TabControllerForSequencedAnimations(
      {int initialIndex = 0,
      @required int length,
      @required TickerProvider vsync})
      : super(initialIndex: initialIndex, length: length, vsync: vsync);

  @override
  Future<AnimationStatus> animateTo(int value,
      {Duration duration = kTabScrollDuration, Curve curve = Curves.ease}) {
    if (value == index) return SynchronousFuture(AnimationStatus.completed);

    final completer = Completer<AnimationStatus>();

    AnimationStatusListener onAnimationComplete;
    onAnimationComplete = (AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        animation.removeStatusListener(onAnimationComplete);
        completer.complete(status);
      } else if (status == AnimationStatus.dismissed) {
        animation.removeStatusListener(onAnimationComplete);
        completer.complete(status);
      }
    };
    animation.addStatusListener(onAnimationComplete);

    super.animateTo(value, duration: duration, curve: curve);
    return completer.future;
  }
}

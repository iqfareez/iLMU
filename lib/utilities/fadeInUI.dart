import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
// import 'package:sa_v1_migration/sa_v1_migration.dart';

class FadeIn extends StatelessWidget {
  final int duration;
  final double delay;
  final Widget child;
  final String direction; //translateX translateY
  final double offset; //130.0

  FadeIn(this.duration, this.delay, this.direction, this.offset, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: duration), Tween(begin: 0.0, end: 1.0)),
      Track(direction).add(
          Duration(milliseconds: duration), Tween(begin: offset, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (300 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
            opacity: animation["opacity"],
            child: direction == "x" ?
            Transform.translate(
                offset: Offset(animation[direction], 0), child: child) :
            Transform.translate(
                offset: Offset(0, animation[direction]), child: child),
          ),
    );
  }
}
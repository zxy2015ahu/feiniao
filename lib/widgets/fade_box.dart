import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class FadeBox extends StatelessWidget {
  final Widget child;

  const FadeBox({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      transitionBuilder: (
        child,
        animation,
        secondaryAnimation,
      ) {
        return Container(
          alignment: Alignment.centerLeft,
          child: FadeThroughTransition(
            animation: animation,
            fillColor: Colors.transparent,
            secondaryAnimation: secondaryAnimation,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

class FadeScaleBox extends StatelessWidget {
  final Widget child;

  const FadeScaleBox({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      transitionBuilder: (
        child,
        animation,
        secondaryAnimation,
      ) {
        return FadeScaleTransition(
          animation: animation,
          child: child,
        );
      },
      child: child,
    );
  }
}

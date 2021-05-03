import 'package:ezanimation/ezanimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';


class TopBarExpandableWidget extends StatelessWidget {
  final Widget? child;
  final BoxDecoration? decoration;

  const TopBarExpandableWidget({
    Key? key,
    this.child, this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationScale = EzAnimation(
      1.0,
      0.66,
      Duration(milliseconds: 350),
      context: context,
      curve: Curves.ease,
    );
    final animationPadding = EzAnimation(
      EdgeInsets.only(
        top: 50 + MediaQuery.of(context).padding.top,
        bottom: 32,
      ),
      EdgeInsets.only(
        top: 20 + MediaQuery.of(context).padding.top,
        bottom: 20,
      ),
      Duration(milliseconds: 300),
      context: context,
      curve: Curves.ease,
    );

    return KeyboardVisibilityBuilder(
      builder: (context, keyboardOpen) {
        if (keyboardOpen) {
          animationScale.start();
          animationPadding.start();
        } else {
          animationScale.reset();
          animationPadding.reset();
        }
        return Container(
            child: AnimatedBuilder(
              animation: animationScale,
              child: AnimatedBuilder(
                animation: animationPadding,
                child: child,
                builder: (context, child) => Padding(
                  child: child,
                  padding: animationPadding.value,
                ),
              ),
              builder: (context, child) {
                return Transform.scale(
                  scale: animationScale.value,
                  child: child,
                );
              },
            ),
            alignment: Alignment.center,
            decoration: decoration
        );
      },
    );
  }
}

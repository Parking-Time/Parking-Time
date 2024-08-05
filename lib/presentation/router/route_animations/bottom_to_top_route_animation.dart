import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomToTopRouteAnimation<T> extends CustomTransitionPage<T> {
  BottomToTopRouteAnimation({required super.child}) : super(
    transitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero).chain(CurveTween(curve: Curves.ease));
      return SlideTransition(
        position: animation.drive(tween),
        child: GestureDetector(
          child: child,
          onHorizontalDragEnd: (details) {
             if ((details.primaryVelocity ?? -1) > 0) context.pop();
          },
        ),
      );
    },
  );
}

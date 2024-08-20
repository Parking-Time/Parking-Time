import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoRouteAnimation<T> extends CustomTransitionPage<T> {
  NoRouteAnimation({required super.child}) : super(
    transitionDuration: const Duration(),
    reverseTransitionDuration: const Duration(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween(begin: Offset.zero, end: Offset.zero).chain(CurveTween(curve: Curves.ease));
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

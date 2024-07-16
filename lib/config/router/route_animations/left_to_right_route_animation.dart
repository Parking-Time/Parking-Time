import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LeftToRightRouteAnimation<T> extends CustomTransitionPage<T> {
  LeftToRightRouteAnimation({required super.child}) : super(
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final inPageTween = Tween(begin: const Offset(-1.0, 0.0), end: Offset.zero).chain(CurveTween(curve: Curves.ease));
      final outPageTween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero).chain(CurveTween(curve: Curves.ease));
      return SlideTransition(
        position: animation.status == AnimationStatus.reverse
            ? animation.drive(outPageTween)
            : animation.drive(inPageTween),
        child: GestureDetector(
          child: child,
          onHorizontalDragEnd: (details) {
            final screenSize = MediaQuery.sizeOf(context);
            final inBackGestureArea = details.globalPosition.dx < screenSize.width;
            final isBackGesture = (details.primaryVelocity ?? -1) > 0;

            if (inBackGestureArea && isBackGesture) context.pop();
          },
        ),
      );
    },
  );
}

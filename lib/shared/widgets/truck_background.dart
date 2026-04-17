import 'package:flutter/material.dart';

class TruckBackground extends StatelessWidget {
  final Widget child;

  const TruckBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.10,
            child: Image.asset(
              'assets/images/truck_background.png',
              fit: BoxFit.cover,
              color: Colors.black,
              colorBlendMode: BlendMode.saturation,
            ),
          ),
        ),
        child,
      ],
    );
  }
}

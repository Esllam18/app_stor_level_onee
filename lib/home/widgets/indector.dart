import 'package:application_2_leveel_1/data.dart';
import 'package:flutter/material.dart';

class IndecatorsForBaners extends StatelessWidget {
  const IndecatorsForBaners({super.key, required int currentIndex})
    : _currentIndex = currentIndex;

  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          banresItems.asMap().entries.map((entry) {
            bool isActive = _currentIndex == entry.key;
            return Container(
              width: isActive ? 20 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: isActive ? const Color(0xff7A9EAE) : Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
            );
          }).toList(),
    );
  }
}

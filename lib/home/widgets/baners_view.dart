import 'package:application_2_leveel_1/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BanersView extends StatefulWidget {
  const BanersView({super.key, required this.onPageChanged});
  final Function(int, CarouselPageChangedReason)? onPageChanged;
  @override
  State<BanersView> createState() => _BanersViewState();
}

class _BanersViewState extends State<BanersView> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: banresItems.length,
      itemBuilder: (context, index, realIdx) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Image.asset(
                banresItems[index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 180,
        autoPlay: true,
        viewportFraction: 0.85,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        onPageChanged: widget.onPageChanged,
      ),
    );
  }
}

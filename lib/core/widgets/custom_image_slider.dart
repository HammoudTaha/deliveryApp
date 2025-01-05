import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomImageSilder extends StatefulWidget {
  const CustomImageSilder({super.key, required this.images});
  final List<String> images;

  @override
  State<CustomImageSilder> createState() => _CustomImageSilderState();
}

class _CustomImageSilderState extends State<CustomImageSilder> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final items = [
      for (int i = 0; i < widget.images.length; i++)
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            widget.images[i],
            fit: BoxFit.cover,
            width: 300,
          ),
        ),
    ];
    widget.images.length;
    return Stack(
      children: [
        CarouselSlider(
          items: items,
          options: CarouselOptions(
            autoPlay: false,
            autoPlayCurve: Curves.easeInOutBack,
            aspectRatio: 2,
            enlargeCenterPage: true,
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlayInterval: const Duration(seconds: 1),
            onPageChanged: (index, reason) {
              setState(
                () {
                  _currentIndex = index;
                },
              );
            },
          ),
        ),
        Positioned(
          left: 65,
          top: 177,
          child: Container(
            height: 22,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$_currentIndex',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const VerticalDivider(
                  color: Colors.white,
                ),
                Text(
                  '${widget.images.length}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

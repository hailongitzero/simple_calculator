import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductImageSlide extends StatelessWidget {
  const ProductImageSlide({super.key, required this.imageCarousel});
  final List<String> imageCarousel;

  Widget _buildItem() {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 5000),
          ),
          items: imageCarousel
              .map((item) => Center(
                    child: Image.network(
                      item,
                      fit: BoxFit.fill,
                      height: 300,
                      width: double.infinity,
                    ),
                  ))
              .toList(),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey,
            ),
            // child: const Text('1/7'),
          ),
        )
      ],
    );
  }

  @override
  Widget build(context) {
    return _buildItem();
  }
}

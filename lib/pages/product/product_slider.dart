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
      ],
    );
  }

  @override
  Widget build(context) {
    return _buildItem();
  }
}

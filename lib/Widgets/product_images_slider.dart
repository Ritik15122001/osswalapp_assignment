import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      indicatorColor: Colors.redAccent,
      indicatorBackgroundColor: Colors.white,
      height: 300,
      autoPlayInterval: 3000,
      indicatorRadius: 4,
      isLoop: true,
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Image.asset("images/Apple Watch -M2.png"),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Image.asset("images/watch 2.jpg"),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Image.asset("images/Apple Watch -M2.png"),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Image.asset("images/watch.png"),
        ),
      ],
    );
  }
}

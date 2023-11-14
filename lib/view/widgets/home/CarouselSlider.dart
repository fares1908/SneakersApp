import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sneakerapp/core/constant/imageAsset/imageAsset.dart';

class CarouselSliderHome extends StatelessWidget {
  const CarouselSliderHome({Key? key});

  @override
  Widget build(BuildContext context) {
    List slider = [
      Image.asset(
        ImageAsset.new1,
        key: UniqueKey(),
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/carouselslider1.jpeg',
        key: UniqueKey(),
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/carouselslider2.jpeg',
        key: UniqueKey(),
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/carouselslider3.png',
        key: UniqueKey(),
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/carouselslider4.jpeg',
        key: UniqueKey(),
        fit: BoxFit.cover,
      ),
    ];

    return CarouselSlider.builder(
      itemCount: slider.length,
      itemBuilder: (context, index, n) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
            child: Image(
              image: slider[index].image,
              fit: BoxFit.fill,
            ),
          ),
        );
      },
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          // Clear image cache when the page changes
          ImageCache().clear();
        },
        height: MediaQuery.of(context).size.height / 4.5,
        viewportFraction: 1,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlay: true,
      ),
    );
  }
}

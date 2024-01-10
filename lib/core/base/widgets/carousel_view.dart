import 'package:qs_flutter/core/base/widgets/app_spacer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../values/app_colors.dart';
import '../../values/app_values.dart';

class CarouselView extends StatefulWidget {
  final Function(int) onTap;
  final List<CarouselData> listOfCarouselData;

  CarouselView({
    required this.onTap,
    required this.listOfCarouselData,
    super.key,
  });

  @override
  State<CarouselView> createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppValues.padding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: (){
              widget.onTap(index);
            },
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll:
                widget.listOfCarouselData.length > 1 ? true : false,
                reverse: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (x, y) {
                  setState(() {
                    index = x;
                  });
                },
                scrollDirection: Axis.horizontal,
              ),
              items: widget.listOfCarouselData
                  .map((data) => Image.asset(data.imageUrl))
                  .toList(),
            ),
          ),
          const AppSpacer(),
          _buildDotSlider(index, widget.listOfCarouselData.length)
        ],
      ),
    );
  }

  Widget _buildDotSlider(int i, int length) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
      ),
      child: Center(
        child: SizedBox(
          height: 20,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 20,
                width: 20,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: AnimatedContainer(
                    width: 20,
                    height: 20,
                    duration: const Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                        color:
                        index == i ? AppColors.colorPrimary : Colors.grey,
                        shape: BoxShape.circle),
                  ),
                ),
              );
            },
            itemCount: length,
          ),
        ),
      ),
    );
  }
}

class CarouselData {
  final String imageUrl;
  final String? productID;
  final String? categoryID;
  final String? shopID;
  final double discountPercentage;
  final String? startingDate;
  final String? endingDate;

  CarouselData(this.imageUrl, this.productID, this.categoryID, this.shopID,
      this.discountPercentage, this.startingDate, this.endingDate);
}

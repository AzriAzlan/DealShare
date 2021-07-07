import 'package:carousel_slider/carousel_slider.dart';
import 'package:dealshare/size_config.dart';
import 'package:dealshare/widgets/deal_tile.dart';
import 'package:flutter/material.dart';

class HotDeals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return CarouselSlider(
      options: CarouselOptions(height: 250.0),
      items: [1,2,3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Container(
                child: Center(
                   child: DealTile(),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

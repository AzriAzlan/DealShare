import 'package:dealshare/images.dart';
import 'package:dealshare/widgets/deal_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HotDeals extends StatelessWidget {

  var images = [Images.nikeLogo];

  @override
  Widget build(BuildContext context) {

    return Swiper(
      itemBuilder:(BuildContext context, int index) {
        return Center(
          child: Container(
                      child: Center(
                          child: DealTile(),
                       ),
                     ),
        );
      },
      itemCount: 5,
      viewportFraction: 0.7,
      scale: 0.8,
      itemWidth:MediaQuery.of(context).size.width,
      layout: SwiperLayout.DEFAULT,
    );
  }
}

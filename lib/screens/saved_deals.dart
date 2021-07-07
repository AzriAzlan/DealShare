import 'package:dealshare/widgets/deals.dart';
import 'package:flutter/material.dart';

class SavedDeals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Saved Deals"),
        centerTitle: true,

      ),
      body: Container(
          child: Deals(),


      ),
    );
  }
}

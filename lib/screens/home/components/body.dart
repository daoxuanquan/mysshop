import 'package:flutter/material.dart';

import 'categories.dart';
import 'home_header.dart';
import 'popular_product.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            HomeHeader(),
            SizedBox(height: 20),
            Categories(),
            SizedBox(height: 30),
            PopularProducts(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:learning/provider.dart';
import 'package:learning/carouselslider/sliderstyle/sliderstyle11.dart';

class Carourselslider1 extends StatefulWidget {
  const Carourselslider1({super.key});

  @override
  State<Carourselslider1> createState() => _Carourselslider1State();
}

class _Carourselslider1State extends State<Carourselslider1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(
          height: 200,
          viewportFraction: 0.5,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
        ),
        items: [
          _buildSliderItem(context, "Arts & Humanities", "assets/image7.jpeg"),
          _buildSliderItem(context, "Computer & Tech", "assets/image8.webp"),
          _buildSliderItem(context, "Photography", "assets/image9.jpg"),
        ],
      ),
    );
  }

  Widget _buildSliderItem(BuildContext context, String category, String imagePath) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('ADD CLASS'),
            content: Text('Add $category to My Classes?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  context.read<UserProvider>().addItem(category);
                  Navigator.pop(context, 'OK');
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
      child: Sliderstyle11(
        imagePath: imagePath,
        category: category,
        title: "12 courses",
      ),
    );
  }
}

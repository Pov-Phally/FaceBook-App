import 'package:flutter/material.dart';

class CoverSection extends StatelessWidget {
  const CoverSection({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: screenHeight * 0.30,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: screenHeight * 0.02,
          right: screenWidth * 0.02,
          child: CircleAvatar(
            radius: screenHeight * 0.02,
            backgroundColor: Colors.blueGrey,
            child: Align(
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(Icons.camera_alt, color: Colors.white, size: 20),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
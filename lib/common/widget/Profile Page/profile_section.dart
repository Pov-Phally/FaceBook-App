import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.image,
  });

  final double screenWidth;
  final double screenHeight;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.02,
              vertical: screenHeight * 0.00,
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(image),
              radius: screenHeight * 0.1,
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
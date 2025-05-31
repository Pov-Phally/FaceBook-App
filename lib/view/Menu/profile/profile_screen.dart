import 'package:flutter/material.dart';
import 'package:social_media/common/widget/news%20feed/news_feed.dart';

import '../../../common/widget/post/post_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: screenHeight * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.blueGrey),
            ),
            Positioned(
              top: screenHeight * 0.06, // Adjust the position as needed
              left: screenHeight * 0.002, // Adjust the position as needed
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
            ),
            Positioned(
              top: screenHeight * 0.20,
              right: screenHeight * 0.002,
              child: IconButton(
                onPressed: () {
                  // Add your settings action here
                },
                icon: Icon(Icons.camera_alt, color: Colors.white),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.125),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.02,
                      ),
                      child: CircleAvatar(
                        radius: screenHeight * 0.1,
                        backgroundColor: Colors.red,
                        child: Icon(Icons.person, size: screenHeight * 0.1),
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
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 20,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                  child: Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(thickness: 3, color: Colors.grey),
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: PostSection(
                    imageUrl:
                        "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
                  ),
                ),
                Divider(thickness: 3, color: Colors.grey),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return NewsFeed(
                      profile:
                          "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
                      name: 'Mengly',
                      time: '2h ago',
                      status: 'public',
                      postImage:
                          "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
                      likeCounts: '10',
                      commentCounts: '20',
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
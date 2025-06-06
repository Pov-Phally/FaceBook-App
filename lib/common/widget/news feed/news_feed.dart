import 'package:flutter/material.dart';

class NewsFeed extends StatelessWidget {
  const NewsFeed({
    super.key,
    required this.profile,
    required this.name,
    required this.time,
    required this.status,
    required this.postImage,
    required this.likeCounts,
    required this.commentCounts,
  });
  final String profile;
  final String name;
  final String time;
  final String status;
  final Widget postImage;
  final String likeCounts;
  final String commentCounts;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Profile
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenHeight * 0.01,
            vertical: screenWidth * 0.01,
          ),
          child: Row(
            spacing: 10,
            children: [
              CircleAvatar(radius: 20, backgroundImage: NetworkImage(profile)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        //Status
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenHeight * 0.01,
            vertical: 0,
          ),
          child: Text(status, style: TextStyle(fontSize: 16)),
        ),
        SizedBox(height: 10),
        //Post Image
        postImage,
        //Like and Comment Count
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenHeight * 0.01,
            vertical: screenWidth * 0.005,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (likeCounts.isNotEmpty)
                Text(likeCounts, style: TextStyle(fontSize: 16)),
              if (commentCounts.isNotEmpty)
                Text(commentCounts, style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
        //Like, Comment, Share
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenHeight * 0.01,
            vertical: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Row(
                  spacing: 5,
                  children: [Icon(Icons.thumb_up), Text('Like')],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  spacing: 5,
                  children: [
                    Icon(Icons.mode_comment_outlined),
                    Text('Comment'),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  spacing: 5,
                  children: [Icon(Icons.screen_share_rounded), Text('Share')],
                ),
              ),
            ],
          ),
        ),
        Divider(thickness: 2, color: Colors.grey),
      ],
    );
  }
}
import 'package:flutter/material.dart';

import '../../common/widget/news feed/news_feed.dart';
import '../../common/widget/post/post_section.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List posts = [
    {
      'profile':
          "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
      'name': "nika",
      'post':
          'hello worldsdadabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',
      'postImage':
          "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
      'like': "100",
      'comment': "10",
      'time': "10h ago",
    },
    {
      'profile':
          "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
      'name': "nika",
      'post': 'hello world',
      'postImage':
          "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
      'like': "100",
      'comment': "10",
      'time': "10h ago",
    },
    {
      'profile':
          "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
      'name': "nika",
      'post': 'hello world',
      'postImage':
          "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
      'like': "100",
      'comment': "10",
      'time': "10h ago",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Facebook",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: PostSection(),
            ),
            Divider(thickness: 3, color: Colors.grey),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return NewsFeed(
                  profile: posts[index]['profile'] ?? '',
                  name: posts[index]['name'] ?? '',
                  time: posts[index]['time'] ?? "",
                  status: posts[index]['post'] ?? "",
                  postImage: Image.network(
                    posts[index]['postImage'] ?? "",
                    fit: BoxFit.cover,
                  ),
                  likeCounts: posts[index]['like'] ?? "",
                  commentCounts: posts[index]['comment'] ?? "",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
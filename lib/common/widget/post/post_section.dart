import 'package:flutter/material.dart';
class PostSection extends StatelessWidget {
  const PostSection({
    super.key, required this.imageUrl, this.onPressed,
  });
  final String imageUrl ;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
           imageUrl,
          ),
        ),
        Expanded(
          child: TextFormField(
            onTap: onPressed,
            mouseCursor: SystemMouseCursors.none,
            showCursor: false,
            decoration: InputDecoration(
              hintText: 'What\'s on your mind?',
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        IconButton(onPressed: (){}, icon: Icon(Icons.photo)),
      ],
    );
  }
}
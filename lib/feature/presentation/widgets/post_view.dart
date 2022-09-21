import 'package:finam_test_app/feature/domain/entities/home_data_entity.dart';
import 'package:finam_test_app/feature/presentation/pages/post_page.dart';
import 'package:flutter/material.dart';

class PostView extends StatelessWidget {
  final PostEntity post;

  const PostView(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage(post))),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF192740).withOpacity(0.75),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 5),
              blurRadius: 10,
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                post.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 5),
            post.thumbnail != 'self' && post.thumbnail != 'default' ? ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                post.thumbnail,
                fit: BoxFit.cover,
              ),
            ) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
import 'package:finam_test_app/feature/domain/entities/home_data_entity.dart';
import 'package:finam_test_app/feature/presentation/widgets/button.dart';
import 'package:finam_test_app/feature/presentation/widgets/post_details_view.dart';
import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  final PostEntity post;

  const PostPage(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            'Post',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF151C29),
              Color(0xFF08153F),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                PostDetailsView(post),
                const SizedBox(height: 12),
                Button(post.url),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

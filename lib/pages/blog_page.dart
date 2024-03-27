import 'package:blog_yan/model/blog.dart';
import 'package:blog_yan/widgets/fy_perview.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    Blog blog = ModalRoute.of(context)?.settings.arguments as Blog;
    return Scaffold(
        appBar: AppBar(
          title: Text(blog.title),
        ),
        body: FYPreview(blog.blog),
      );
  }
}


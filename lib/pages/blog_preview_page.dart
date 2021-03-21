import 'package:blog_yan/widgets/fy_perview.dart';
import 'package:flutter/material.dart';

class BlogPreviewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    String markdownData = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      appBar: AppBar(title: Text("预览"),),
      body: FYPreview(markdownData)
    );
  }
}
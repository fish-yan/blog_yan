
import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class FYPreview extends StatelessWidget {

  FYPreview(this.data, {this.tocController}):super();

  final String data;
  final TocController? tocController;
  @override
  Widget build(BuildContext context) {
    String text = data.trim();
    var empty = data == null || text.isEmpty;
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: Border.all(
            color: Colors.grey[200]!,
            width: 1
          )
        ),
        height: MediaQuery.of(context).size.height,
        child: empty ? Container() : MarkdownWidget(
          data: text,
          controller: tocController,
          styleConfig: StyleConfig(
            pConfig: PConfig(
              onLinkTap: (url) {
                _launchURL(url!);
              },
            )
          ),
        )
      );
  }

  _launchURL(String url) async {
    
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
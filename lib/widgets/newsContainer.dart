import 'package:flutter/material.dart';
// import 'package:controller/fetchnews.dart';
import 'package:news_snack/controller/fetchnews.dart';

class newsContainer extends StatefulWidget {
  String imgUrl;
  String newHead;
  String newDes;
  String newsCont;
  String newsUrl;
  newsContainer(
      {super.key,
      required this.imgUrl,
      required this.newDes,
      required this.newHead,
      required this.newsCont,
      required this.newsUrl});

  @override
  State<newsContainer> createState() => _newsContainerState();
}

class _newsContainerState extends State<newsContainer> {
  @override
  void initState() {
    FetchNews.fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.network(
          widget.imgUrl,
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Text(
                widget.newHead,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                widget.newsCont,
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                widget.newDes,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  print("Going to ${widget.imgUrl}");
                },
                child: Text("Read More"),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  MovieDetail({Key? key, @required this.id, @required this.title})
      : super(key: key);
  final id;
  final title;

  @override
  _MovieDetailState createState() {
    // TODO: implement createState

    return _MovieDetailState();
  }
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Text('平台id为:${widget.id}'),
    );
  }
}

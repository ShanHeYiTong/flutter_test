import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

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
  final TextEditingController _controller = TextEditingController();
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.events'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Send a message'),
              ),
            ),
            const SizedBox(height: 24),
            StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? '${snapshot.data}' : '');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      // print(_controller.text);
      _channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    _channel.sink.close();
    _controller.dispose();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  // TODO: implement build

  // return Scaffold(
  //   appBar: AppBar(
  //     title: Text(widget.title),
  //     centerTitle: true,
  //   ),
  //   body: Text('平台id为:${widget.id}'),
  // );
  // const title = 'WebSocket Demo';
  // return const MaterialApp(
  //   title: title,
  //   home: MyHomePage(
  //     title: title,
  //   ),
  // );

  // }
}

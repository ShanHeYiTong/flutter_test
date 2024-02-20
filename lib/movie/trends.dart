import 'package:flutter/material.dart';
import 'package:flutter_application_20240130/movie/pengyouquan.dart';

class Trends extends StatefulWidget {
  //固定写法
  // MovieList({Key key}) : super(key: key);
  // MovieList({Key? key, @required this.mt}) : super(key: key);
  //信息
  // final mt;

  @override
  TrendsState createState() {
    // TODO: implement createState
    return new TrendsState();
  }
}

//有状态控件  就必须有状态管理类 来进行实现
class TrendsState extends State<Trends> with AutomaticKeepAliveClientMixin {
  var mlist;
//保持列表状态
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  //控件在创建的时候 会执行 initState
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovieList();
  }

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

//渲染当前这个MovieList空间的ui结构
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.amber[colorCodes[index]],
          child: Center(child: Text('Entry ${entries[index]}')),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );

    // return Scaffold(
    //   // appBar: AppBar(
    //   //   title: const Text('First Route'),
    //   // ),
    //   body: ListView.builder(
    //     itemCount: 1,
    //     itemBuilder: (context, index) {
    //       return ListTile(
    //           title: Text('朋友圈跳转'),
    //           onTap: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (context) => PengYouQuan(),
    //               ),
    //             );
    //           });
    //     },
    //   ),
    // );
  }

  getMovieList() async {
    try {
      //发送get请求
      // var response = await dio.get('http://192.168.0.176:9300/api/platform');
      // var response = await dio.get('http://192.168.0.176:9300/api/platform');
      //处理数据
      // print(response);
      // //数据赋值 使用函数 SetState
      setState(() {
        mlist = List<String>.generate(10, (i) => 'Item $i');
      });
    } catch (error) {
      print('Error fetching data: $error');
    }
  }
}

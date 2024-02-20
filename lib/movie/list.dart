import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_20240130/movie/detail.dart';

class MovieList extends StatefulWidget {
  //固定写法
  // MovieList({Key key}) : super(key: key);
  MovieList({Key? key, @required this.mt}) : super(key: key);
  //信息
  final mt;

  @override
  MovieListState createState() {
    // TODO: implement createState
    return new MovieListState();
  }
}

//有状态控件  就必须有状态管理类 来进行实现
class MovieListState extends State<MovieList>
    with AutomaticKeepAliveClientMixin {
  Dio dio = new Dio();

// 默认显示第一页数据
  int page = 1;
// 每页显示的数据条数
  int pagesize = 10;
//电影列表数据
  var mlist = [];
// 总数据条数，实现分页效果的
  var total = 0;

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

//渲染当前这个MovieList空间的ui结构
  @override
  Widget build(BuildContext context) {
    // return Text('这是信息页面----' + widget.mt);
    return ListView.builder(
      itemCount: mlist.length,
      itemBuilder: (BuildContext ctx, int i) {
        var mitem = mlist[i];
        return GestureDetector(
          onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext ctx) {
              return new MovieDetail(
                // id: mitem['id'],
                // title: mitem['title'],
                id: mitem['id'],
                title: mitem['key'],
              );
            }))
          },
          child: Container(
              padding: EdgeInsets.only(left: 10),
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(top: BorderSide(color: Colors.black12))),
              child: Row(
                children: [
                  Image.network(
                    // 'http://101.39.192.162:7000/game/69e883c3jw1e8qgp5bmzyj2050050aa8.jpg',
                    'images/generate.jpg',
                    width: 32,
                    height: 45,
                    // fit: BoxFit.cover,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Text('会话名称:${mitem['id']}'),
                        // Text('会话内容:${mitem['title']}'),
                        Text('会话内容:${mitem['key']}'),
                      ],
                    ),
                  )
                ],
              )),
        );
      },
    );
  }

  getMovieList() async {
    try {
      //发送get请求
      var response =
          await dio.get('http://192.168.0.176:9100/api/chart?page=1&limit=10');
      // var response = await dio.get('http://192.168.0.176:9300/api/platform');
      //处理数据
      // print(response);
      // //数据赋值 使用函数 SetState
      setState(() {
        mlist = response.data['list'];
      });
    } catch (error) {
      print('Error fetching data: $error');
    }
  }
}

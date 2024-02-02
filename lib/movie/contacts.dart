import 'package:flutter/material.dart';
import 'package:flutter_application_20240130/movie/contacts_detail.dart';

class ContactsList extends StatefulWidget {
  //固定写法
  // MovieList({Key key}) : super(key: key);
  // MovieList({Key? key, @required this.mt}) : super(key: key);
  //信息
  // final mt;

  @override
  ContactsListState createState() {
    // TODO: implement createState
    return new ContactsListState();
  }
}

//有状态控件  就必须有状态管理类 来进行实现
class ContactsListState extends State<ContactsList>
    with AutomaticKeepAliveClientMixin {
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

//渲染当前这个MovieList空间的ui结构
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return Text('这是联系人页面----');

    return ListView.builder(
      itemCount: mlist.length,
      itemBuilder: (BuildContext ctx, int i) {
        var mitem = mlist[i];
        return GestureDetector(
          onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext ctx) {
              //跳转的页面
              return new ContactsDetail(
                mt: mitem['title'],
//               title: mitem['title'],
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
                    'http://101.39.192.162:7000/game/69e883c3jw1e8qgp5bmzyj2050050aa8.jpg',
                    width: 32,
                    height: 45,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('${mitem['title']}'),
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
      // var response = await dio.get('http://192.168.0.176:9300/api/platform');
      // var response = await dio.get('http://192.168.0.176:9300/api/platform');
      //处理数据
      // print(response);
      // //数据赋值 使用函数 SetState
      setState(() {
        mlist = [
          {'id': 11, 'title': '曹操'},
          {'id': 12, 'title': '郭嘉'},
          {'id': 13, 'title': '周瑜'},
          {'id': 14, 'title': '孙策'},
        ];
      });
    } catch (error) {
      print('Error fetching data: $error');
    }
  }
}

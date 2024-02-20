import 'package:flutter/material.dart';

class ContactsDetail extends StatefulWidget {
  //固定写法
//   ContactsDetail({Key key}) : super(key: key);
  ContactsDetail({Key? key, @required this.mt}) : super(key: key);
  //信息
  final mt;

  @override
  ContactsDetailState createState() {
    // TODO: implement createState
    return new ContactsDetailState();
  }
}

//有状态控件  就必须有状态管理类 来进行实现
class ContactsDetailState extends State<ContactsDetail>
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
//     getMovieList();
  }

//渲染当前这个MovieList空间的ui结构
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          //   brightness: Brightness.dark,
          //   primaryColor: Color.fromARGB(255, 17, 223, 65),
          ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: ListView(
          padding: EdgeInsets.all(2),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(widget.mt),
              accountEmail: Text('2094089664@qq.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1bfU1SLHj1h06z_IHYQOuR-mkRbswHKyQjw&usqp=CAU'
                    'http://101.39.192.162:7000/game/69e883c3jw1e8qgp5bmzyj2050050aa8.jpg'),
              ),
              decoration: BoxDecoration(
                  //背景图片
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("images/qingshan.jpg"))),
            ),
            ListTile(
              title: Text('描述'),
              trailing: Icon(Icons.feedback),
            ),
            ListTile(
              title: Text('朋友权限'),
              trailing: Icon(Icons.settings),
            ),
            ListTile(
              title: Text('朋友圈'),
              trailing: Icon(Icons.send),
            ),
            ListTile(
              title: Text('更多信息'),
              trailing: Icon(Icons.send),
            ),
            //分割线
            Divider(),
            ListTile(
              title: Text('发消息'),
              trailing: Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
    );
  }

//   getMovieList() async {
//     try {
  //发送get请求
  // var response = await dio.get('http://192.168.0.176:9300/api/platform');
  // var response = await dio.get('http://192.168.0.176:9300/api/platform');
  //处理数据
  // print(response);
  // //数据赋值 使用函数 SetState
//       setState(() {
//         mlist = [
//           {'id': 11, 'title': '曹操'},
//           {'id': 12, 'title': '郭嘉'},
//           {'id': 13, 'title': '周瑜'},
//           {'id': 14, 'title': '孙策'},
//         ];
//       });
//     } catch (error) {
//       print('Error fetching data: $error');
//     }
//   }
}

import 'package:flutter/material.dart';

//导入信息页面
import 'movie/list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '青山'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
// keytool -genkey -v -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2053 -validity 10000
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                //点击行为
                onPressed: () {},
              )
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.all(2),
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text("青山影"),
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
                          image: NetworkImage(
                              "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUVFRgVFRUYGBgSGBgSGBgYGhgYGRoYGhgZGhgYGBkcIS4lHB4rHxgZJjgmKy8xNTU1GiQ9QDs0Py40NTEBDAwMEA8QHhISHzQrJCs0NDQ0NDQ0NDQxNDQ0NDQ0MTE0NDQ0NDQ0NjQ0NDQ0NDQ0NDQ0NDQ0NDQxNDQ0NDQ0NP/AABEIAMABBgMBIgACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAACBAABAwUGB//EADcQAAEDAwIEBQIEBgIDAQAAAAEAAhEDITESQQQiUWETcYGRoTJCBbHB8BRSYtHh8TOSFSPyBv/EABkBAAMBAQEAAAAAAAAAAAAAAAABAgMEBf/EACQRAAIDAAICAwEAAwEAAAAAAAABAhESAyEEEzFBUWFxkfAU/9oADAMBAAIRAxEAPwD6WEQVBEFybOnJYCIIQiCNCouFYCgRBPQUSFYCitOySoUhXCsJ2AMKEIoVQiwBhDpWioosDMhCQtSEJCNDoyIUhGQhIT0FAKFEVRT0JxAhREUMJ2TkoqlaiehZBUVlUnoMlKKKI0KgSFCFaFGhZJCohWqT0LJUKK1EaFkYBRApcPVh68r2HouIyCiBSwqIw9P2EuAwCiBSweia9UuUlwGAVYKxa9GHKlyohxNZUlAHKala5ELIakoNSmpVtBkIlUShLkJcl7EFBkoSUBeq1qfYishEoSh1KF6PYVRaoodShcqUwwWUKrUqLk9iyEqQlyrUnsWQlRVFyrUq0LJaiHUqL09CyEqJQ6kOpGhZDlUSgL0JenYZNJUWWpRFiyAKiIVFzW1kQrrzHCR6mUdIVEQqLnCsjFZZuMhYOgKiIVFzhWRCqs25IXrOiKq0bVXM8VEKqiXJJEviOoKiLWuY2ujFdZS8qUTN8J0PEVGokfHQGuqj5UpCXCx81EBqJE1lRrLaPLJlriHTUQmokjWVGstFKTK9Y94imtIGuhNdaJyD1nQ1qjUSHjqjXVrQYH/EVeIuea6o8QrSYso6HiITUXPNdTx1ooslxQ+airxUga6Hx01FktI6BqKvESHjKvGVZZLSHzUQmokvFVeMqUWT0Omoq8RJGsq8ZNRYrQ54iiSNZRVlitCYqKxVSupWHK/UhrnY2KyLx0mCrlS+BFLyGOjiEQ4hIyr1KH48S15DHxxK0HEBc0OVhxWcvFiy15COmOIWtOqSQAJJsAFyA8o21iMFYT8CMilzxZ1KlUgkEQRYgrM8Que6sTkoS8oj4EYg+aKOgeIQHiUgXlVrW8fFihPyEPHiEJ4hJypKtePFGb8gbNdV46VlVqWi4US+djfjKvGSupTUn6UQ+djXjKvFS2pTUqXES+ZjHiqeKl9SmpV6yXzG/iqvEWGpTUngl8puairxFjKqU8EvlN9arWsdSmpPBPsNdahesSVJTwL2GutRYyonhC9go1yMVOy1ZRJRDhlpSMdMyD0YqLUcKN0RoAbpZQ9sAPRalRAz+qDUlgrbNQ4Ig4JN/FNaYJ/M/kjHEsO490sjXIxjWOqmsLLxGblZu4lm10ZQexm5qBTxB0S4r/0/Kjq39KMoPazcvCpL6kOtPAPkY0WodKW1eavxCngnZuWnqqusTWPRG2pO6MhsPxD0VGt2KsK9B6J5FtgOrDusjxPYpjw+ohU6m3qnklzZh/FdvlWeL/p+Vr4A6hD/AA52ujItMAcV1b8q28UOijqB6LN1M9E8onTNxV6KeIUs5rkILkZQtMb8VV4qwNQ9/dZurv2j1unkWmOB56qF8ZKRdxD+3sgNZ/UewTyg2zoeJ3UXPHEO6D2VIyhbZ2NZ6BEakbhLseHfcjPD+qVFaCdxAO4+Fi94OXK/4fsoeH7FFBoyLgMXWbqztrJocMeiJvBORQWcs01baS6Z4NwU/hSlQ7EPDKEghPupQs3U5RQaEebMlQl38x906aCHwEUGhE0z1+Vsys4brc0VXgooNACs7sr8c9AjFIIm0x1CKFZm2udwPRAah6Jp1No39rqaWxv5J0KzNnEQIhTx3m0x5IxTnZbDhgBcwigsU0E9Vs1x6rUsaPuWL6g+0e6dA2bNnorAKWY9y2/iOx90C0btc4H+6PU7oPZYM4gRdpn4VDiH7GEUGhxlNrvqEHsgfQYPuHwsnVXHKAnsigckUWNPVUaDeqtjSVu2m5URYseFQHhFu8ImPj7kxWJHheyi6BreXsVEAcZocNyFsyq8YcUsKsbpim8EWU0XZsOOqfzfA/stf/IPjDZ6x/lJtribkLQ8S04hFBo2bxj9yD6LZ3HuiBASObyrc+EqHoeHGOjI9Asnue7JPpZLeK1V/EkfSig0M6Zy73KmgDdIurfzGVTa42CAs6BKtulJMrHoj8QlAWOOewfcfZYurNOPyWBcNyFi/iGjBk9rooLGtYK2ZSnC5hqTuiZWc3DiPIlAh97QLKNqtBvCQLibz8qtKYrOq7iGDF1k+sXdAkQ1aa4RQWbgI3Oa0SUtrsqmUybG9bY5brPxiOiz0FvS6Et6oBsM8R1KI8RGLrIMRODW5m9km0gVsNnFR1+FH8WgqVGMA1ECTHVLO41hHLJmYkdFm+aCfbHmRq+tOZ/RBHZA/jGCBmbSBg9wuT+JcW9vXSZmzu2IOLjKFzwfwyocMpndY+Oo+ER4qO68twn4o62i7dUEAE+cE4PddLh/xJjzDAZMi4FozfCb5oqLbCfjzjX4docU3oVFy38aAYMD99lFn/7IfjIxIghE2oAlmv7D5Va+3ZdAWOFDqhIEnqtWXyUWMZdWA3VCqMrF7NxtlAwoFYy+sI81n4pQaCdlu3hbS63mQPzSY1ZGXVPqQo57GgwQT7/2SKVgN/xTtlDxLjkpU1IFlGvQM31dVXiHYLPxb47b5VzEXB3tKVgb06k5WgqBLiP7g/3VOqQcQmmKxtj0XiQkxWPQI/FPZUJs6FPiINxMpljmuPRcplbqE5TLTuixWNVKHdA2ipU4loA3PVLGoTv7SiwY+KYGUnxfGMYJv2H5perxTWyNRcQYNjAPeVw+Keahl5PLzTOBkQJnb8ly8nOrzH/ZcYurHX/j7zq0uI20iBMRcz5pWnx7nkkug7SNUySL/wAondIu4fW0CQ0ixdM9b3/dlqahDcACxbAEk/TzDpY+6533/ku6XRu95IkkQR0IzOR1CwD4Ia55tsOfBnLSft8ln4d4MHUJiTN7kRPcE/2REwA0uGqTAdFhmO24M7ISpBfQwyu4X06choOSf9GVbOKdEFsidN/u2JgxImf2UvrfFgJcOUyRAPfaBKy4mi8aXOkGTc2mwOB1hLKb7BdsdrOaGkBrA4EuFm7Cceytj9DWm0OlxEaemBuMfPqhwzNLg9xGkHTN5a+BBI6B1/W63fQkC5JiSRzEuufaw+VTj1RTbaqxmtXcT9IMbxAg4x+8qLm0KthiSPph0iLXABj/ACqU+tE5/p34VPd8IGPA6+WVH1Gza0dp9V6WjKgmtlbNLAcu9AEseIBgSelxCt7RkE99j/pJux1Rs6uJhrTHUx+iWquJ2t2RPIaIIzsP1WbK4m4AB+O6VjoZovcAIMgWtcj3VcQ8k3dqtY/vBVvcYkEEDHltLTMIA+3QnNhB/cpJg0C1jjhU4RZEG6jBJDgMHft2KFrYP6ntaAnYUGyjm0xnp5EoXVQDEemI2jqpVqQIdgSLXI632KVJk8u8WBU2A67TaAB1F59Fb6O4BI3Mfn0KyNXS3HN1OR3BnyWNOoc6j1333/fZK2DjZq14i5Hktm1Gx2HRLVOMfP1EkdYd/wBgcrem1rxMhpvIIIbNo0nab2T1+hRbHtJ3A6ndbSDiD/ZI1qJYYcI3HcdR2WtKnaYOY7fvyTv7JpDbCDtPlke63ZT6fOUDKU2+l3TY+2EWmD36H9E1IVFimcQs+JrFnK2NR3OGiMkphtUwZtAO18bFc1/EtGuCMATMWvYR3C5vJ5ZKoxNIRS7YpXqSdLZc4gwZgEggG3T/AAlar3gEjm1bRdxnAOYAn4RPIEum5lxJnVzEahOBshpaNZ1TzzMExyjFnX9O654qkWynWYGyLmAG5AgQbC1zP6Kmh2oYBMuJkGINg62btxut9ZyG3JgEzYHM9iBPt0WTXgRqEOBES4tBMmLkbztO6dsS7QDyA6RALWDLvvO/S0Y31DKV4Zh1F2kPBBDjJho3knE3F+6eFVjYEGBqaXOEayCQQDaevog4kBn0N0knVyk/SYBOcTI9FSl9BddUGygTIcXjREDYCLtx/LMR7o+I4saXGRAMQbwIA6ZylWseTq8sZIJMwBmOm0IWM1S1h+oybanQRGqOlxvZFK7YlHu2zZrTou0w4FxLg4CftA7+Sum2DIc67eYGSRvHYdelltxHEH6DIBm5Iltpbp023KplBxNiQ0mHDpa0iQSZDvhO21bLu1bQuKTH3eWgjlJdpBJGBBzA3UR8HTaBLm6pxPSbFoiYsc9lENoVj9csYZDp6gC3uVjU4wuDRDRE3Ekm83n9FVVsCLuPQ3INpsIz0k5QUmCeflGRY3M4tjddGh5QxS4x12tYBI+q0xi5NvWy3bxlVjQCGQLtI0kHrJElIcXw5bBB1NPMCLx5xgJZzy65z2gT1Pmj5EdJ3GFwtG8mO/RY0eI2jNjNrfmrbxrtJaIs2LgZO/z+SIOY+NWppwSNJbMZiAhSBmzOrDYkiD54vlRzL2bEjqUvV4UtwZaSYPl6rdheblpsIsLmLm2/snaFQbK0WB9f35rHWQLm4/I7RsqfUGRfbcHy9k1Q4Wk5ut7yxwgEXLiTgixGZyqsFE5xcXHTc9+i2a0MBgSSIsRHzeMLV7GA6WvJd3gD/awczQZPNkgWNjuYJupsM9g02E3OBczuie/oAPPba376IvGkSbADYY2Cx8fpPmSUWDRYB3tPbp323VxjcYtYe6FhJ/SVDM3P76pioYp8U8WBt5W2+Vo5xALibn3nz9ErQpuN2y47QCT5j4TNSi+btIAaCScAenspbSJo2o1zYzpE3/mmNh7p3h6gdH3OuA13KTpAw4WB2XNYJi50jFx1NhFgugQ1vO86iSAAJvNiGrOc1FWUoN/QH4txQFMu0lrgHNDcTAJIBwfRcKo94dGmRe5sHfVJH9MkjPon/wAXeXML3TZ1t4JwIFhtgrm8YWhodqlxi1h9sYbj7vULBPXb+zbGYpMGvYOxPJDYFyZdiJtf3RcFTqOBc2WkFrQSOUNdYnmI1Y2vZZcRULm6SdIbD3CGu6mYm4xfyC0bxLg4uB/5IcWw0hpj7bZv8IadUiUui6r2gmNUSGyZB1aQ7m1XuLwVX8UQNLSJn6oJib4n09PRDWfYNa8wDr0mCBB1CDGZvecIeGdqdJeRE30h0zMiDjGc3VZ6tjzRtxFUBpOk3I1Gd+U46yRdJtY6dQJuQ3BiRkAg9JtZPU3W5XD6ZlwA55PKdyBOUpQ4jn1xqvzXIYSQZBtYwfdEX0xR+GMcOANR1a5+lgdcAR0vM2P+1uynfQ3lBABAN5dgkd4Of1Ur1HGHssQ4FpDWklsc0zy5M5vCHj6wLuUS0sIyfuJmwEAQ3494ttmTTbMqkyDq1EfWbC4J74iM5nZbcWyIEkhjGkEOGkkvzPTIzke6/DUGva4ucZI5cYIBm/eR6FZvc4NOh5IpiAHDDcjSPMn2WjTpG7hUUkb8SxoMvJ2jci2OXODfyUXU4F2hjWEtBgOMEiZ8h38vZWsfY19GN/047argCGuI7A2TVLjLQ9jHHq4SSfOUk3+mbyAYG3kVoBEar2Doaf3AXa0jQeo8W1ly0tvEscdx/wDNkFc03XLC2LDRBnubCVgyqcGOhBAuMifXdQUTBc2IgkjULBvnF7pV9iNhwOuNNtU/VGmAJuQLH0WQolp5paMA2I+J3/VZUiZGTO/W+Sm+H/ECBDoJgghwE2wZyUdgwafFQ3SbggWyJ6kFNNrMi8hxI5m/TjviClXNY4S0EZuMC402PzfrZYlxbGrEwDeOuU+mPsfbUBF32wQQDceWcm/ZThqul0ExqGnsP5SeuyULBNyTJ3t637JuixgBLr7MzMi5xtH7EIukIzr0SwkvsGmHE3JOwAvN/RDV4kNbDWhsDfnMZuIAAKUqVXPfJk6jAEezQPNNM4QAf+w6TP05c6+IG9jb8km/0dG3C1dTRqYwBl3PGoGCMWtqwI/2seK41mBNiCATOBg7EdbIeN4nVFMN06JmLCN3GMu/QJKq9ocLwcj0OoeqhWJx7s6tV7JLdLAcB2p0TAvnEpzharJAJawOaAQ1gLSRtqiYN5N8Cy4PhneMTeBMm1xkHqm6PBOe0OaDAcGuINtwQ0RNvzlJ0l2wVIY4g1JJnU1v8hBAE2OkRHtuj4H8SLDBO9pLidxjbK1ocHoMBpncuteNpyPyhdF7LAugxbUYc+39RFhAjOyzlONVRcYafRz+LeydbWanuECYh3QuAAGN84RVXxSEkB84H0tBAs3oYueuoLR9VpgFwa1x0uImS0XMdP8AAXP43jA950jlbqgkho1XDfn81mrqv+o0rPVnQ/8A0rIo0Q0DSYOsRBcSCZgdv3C4tJoeGyDyvJPflIH5phnH1WCJGmTqaRra/a4wZjPZGeJoOAJYWaoMsNpP9Dpj3C1TVB7I/Jyq1HkbkEvEzvmZ6qtDQJk6gAWyJAN7ehK6rvw4P/46rXRcNcdDwSDYi4+UpU/DazDzU3xcyGkjbDgIV9ME0ZM4ZxZraPWYtjA3kfCWqcI4cwj0ncCT8lP0OKDW6OkAgWM6s38/hE6qIkwCD9wg3G3ZCGkq6Oe9kN5g4gwRcabmfMCwPqltUhxOdUzZvkBHYldCrWF846XxtfBStBgvABO02GfgXKKIaRr4j+QaSGFzYIyTfVHcibp7i6zPGa2wY0XjJnp6BKVammGgjQ0kskECQZIDsTJJERgdEpVLbPaYvBzN5ifY2lRGNysiNXY/Vc0SGiwGn7ZjY/5VUq7D9I+qxI+0SLttIz5WRvEAOeRzuIcWgTLrm+JST3AvhjngaRZoc645ohtzbKtuzSTs38MMJFX7uZpLnCWncGM3uOw6KJkmobaxLDDg+SQXAOsB+dsCyiytfphTf2Jvhv0kRgm9j0WYeNt12KUai0MZBy6SDN7uacY2UqspPlkwRccobB7EZM+i6NGjVHI1xY+U4TFGpG4AuL59fVR/BzJ1tx92oe1lk2m5pOJFhF57dLzunYqNaz3XO8DEQRaZjKw1Tkd7ZPr6rUkWmWm4+mJ3k7b7LJ1N14MxjaU0CRtTMQdYg5Fz0kQmy6Bynldm7QD3GpIM4V5GIBNt/ZNeAGDmbrcfpmS0QegNz2+ENhX0XTgS6XBhwDucW2N/hUxz6lmYkMvu45uMBG57nQXs1uc6GtbAjqdIC1DGh01HDS36WMlsGbgxBcRj9VnKVDrrsLW2idNIh750lxGDOGbx9XnZEeCeIe97QZMhxkkETOcXNh0ysq9dh5KbA0mW6tLiZN8gEjG8YWNWs1/KWuIEczrGANRLWtG/eVk5N/Arv4GKHBMaC7Ub2l2Im8AbGCfZbUgymSGQJEucQ4uc0CczFzmAFm9heNLbCQXSPqEzpWLKNMSXEvJkRqIAl1y42H/VTUpfLLjHq2O0KxeQKUNZYAhtwTNg4j/K7PDAPBLSToaS55nQIyQPuvgA365XGaLTaGmIgtYewESGrqVhp4WRYF51OvhokC36KFFX2XFJGdXi23duZ5yIJF9tthbouaeMLiQI2sZ6G5EYOywrViQXgHSOXGmSbADc/UeyL8P4R5eyGy9x1C+LG56ACVaiqBy6pAcfxWhon6jLRpm7rHfAsudWeC4RaLm0i9xnMEhO/iVQeI6A3RTOgONyS14GrpGq89t1zmENcS0SREvfLiZhziWzAwPNUlRlJ9m51Tr354kiG4Db4jmJ81KTGNYS4iWnAmZItpAPcfKwaXTcjlBcBYycTG2w9B5rWoabTDZ1yTiwkQJ67epTZH8NeEe0i+okFlxE6hOPIA27p7h+Ley7XPuBIaS4ZloZH1E3k9gue0Oa0CDzN0tmILpA0xFrbSurToOa0QwguJtEae28+azlKhxi27TMj+PvLnfQ5rWzztBk2ECb9cDorp8bSLA6rSpiemppjrINrFNt/DaOQOaQ52kQ1xsOa2MG24W1KlTP1saXhpH0zYEBoPf6VD50l1Zr65P4ZzWs4Z+GvZcwAQ4HpANzPnsgqfgzXN5KzLmxcHMm0xuOl13GMpiAw6Q0g4mYH6pR9egwMZpaAw21XgxF5zY7oXktvpDcKXbOLV/B6zJL2yLnUDqYdp1NmDHULm0aR2I0teDN73z6R8L2PA12kFzDph2mxt6R6JviXMcbtabThokjNh5Sm/JivrsEjx4aSdbydIPI20EzYEmzR+i6IYJMgugXLbkztJA67fkui78Lpvl7bSA3Q4GAAIsMR+pKZbwTCBFg2AGgadrz129lEvITMpQlYhw3AhslhjVE5+0QN1E3WpsYYjrmQduhUWXsbD1o/9k="))),
                ),
                ListTile(
                  title: Text('用户反馈'),
                  trailing: Icon(Icons.feedback),
                ),
                ListTile(
                  title: Text('系统设置'),
                  trailing: Icon(Icons.settings),
                ),
                ListTile(
                  title: Text('我要发布'),
                  trailing: Icon(Icons.send),
                ),
                //分割线
                Divider(),
                ListTile(
                  title: Text('注销'),
                  trailing: Icon(Icons.exit_to_app),
                ),
              ],
            ),
          ),
          //底部的table
          bottomNavigationBar: Container(
            //美化当前Container盒子
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 190, 102, 222)),
            height: 50,
            child: TabBar(
              labelStyle: TextStyle(height: 0, fontSize: 10),
              tabs: [
                Tab(
                  icon: Icon(Icons.movie_filter),
                  text: '信息',
                ),
                Tab(
                  icon: Icon(Icons.movie_filter),
                  text: '联系人',
                ),
                Tab(
                  icon: Icon(Icons.movie_filter),
                  text: '动态',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MovieList(mt: 'in_xinxi'),
              MovieList(mt: 'in_lianxiren'),
              MovieList(mt: 'in_dongtai'),
            ],
          ),
          // body: Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       const Text(
          //         'test 20240130',
          //       ),
          //       Text(
          //         '$_counter',
          //         style: Theme.of(context).textTheme.headlineMedium,
          //       ),
          //     ],
          //   ),
          // ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: _incrementCounter,
          //   tooltip: 'Increment',
          //   child: const Icon(Icons.add),
          // ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:peticiones_post/post.dart';
import 'package:peticiones_post/get_data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Data data = new Data();
  List<Post> _post = List<Post>();

  @override
  void initState() {
    data.getPost().then((value) => setState(() {
          _post.addAll(value);
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.view_headline),
          onPressed: () {},
        ),
        title: Text("-POSTS-"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
        itemCount: _post.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            color: Colors.blue,
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, right: 25.0, left: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        _post[index].title,
                        style: TextStyle(
                          color: Colors.black38,
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text("\n${_post[index].body}",
                        style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    margin: EdgeInsets.all(50),
                    width: MediaQuery.of(context).size.width - 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          color: Colors.black,
                          iconSize: 40,
                          splashColor: Colors.blue,
                          icon: Icon(Icons.share),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

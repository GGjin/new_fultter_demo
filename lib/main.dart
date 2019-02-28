import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: RowWidget(),
    );
  }
}

class ContainerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Container"),
      ) ,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(20),
      width: 80,
      decoration:BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }

}


class RowWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Text("aaa"),
        Text("bbb"),
        Text("ddd"),
        ColumnWidget()
      ],
    );
  }

}


class ColumnWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("aaa"),
        Text("bbb"),
        Text("ccc"),
        Text("ddd"),
        Text("eee"),
      ],
    );
  }

}



class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6K6FsGXKZKNbTQgnflJxHyMwoI5Gs_T2gAbTRmZQOVEOeqi_TNw",
      width: 200,
      height: 200,
    );
  }
}

class MessageForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MessageFormState();
  }
}

class MessageFormState extends State<MessageForm> {
  var editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "new flutter demo",
          style: TextStyle(
              color: Colors.orange,
              fontSize: 20
          ),
        ),
      ),

      body: Center(
        child: new Row(
          children: <Widget>[
            Expanded(
                child: Material(
                  child: TextField(
                    controller: editController,
                  ),
                )),
            RaisedButton(
              child: Text("click"),
              onPressed: () {
                showDialog(context: context,
                    builder: (_) {
                      return AlertDialog(
                        content: Text(editController.text),
                        actions: <Widget>[
                          FlatButton(onPressed: () => Navigator.pop(context),
                              child: Text("OK"))
                        ],
                      );
                    });
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    editController.dispose();
  }
}

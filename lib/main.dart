import 'package:flutter/material.dart';

void main() => runApp(NewApp());

class NewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final buildings = [
      Building(BuildingType.theater, "CineArts at the Empire", "85 W Portal Ave"),
      Building(BuildingType.theater, "The Castro Theater", "429 Castro St"),
      Building(BuildingType.theater, "Alamo Drafthouse Cinema", "2550 Mission St"),
      Building(BuildingType.theater, "Roxie Theater", "3117 16th St"),
      Building(BuildingType.theater, "United Artists Stonestown Twin", "501 Buckingham Way"),
      Building(BuildingType.theater, "AMC Metreon 16", "1923 Ocean Ave"),
      Building(BuildingType.restaurant, "K\'s Kitchen", "K\'s Kitchen"),
      Building(BuildingType.restaurant, "Chaiya Thai Restaurant", "72 Claremont Blvd"),
      Building(BuildingType.restaurant, "La Ciccia", "291 30th St"),
      Building(BuildingType.theater, "CineArts at the Empire", "85 W Portal Ave"),
      Building(BuildingType.theater, "The Castro Theater", "429 Castro St"),
      Building(BuildingType.theater, "Alamo Drafthouse Cinema", "2550 Mission St"),
      Building(BuildingType.theater, "Roxie Theater", "3117 16th St"),
      Building(BuildingType.theater, "United Artists Stonestown Twin", "501 Buckingham Way"),
      Building(BuildingType.theater, "AMC Metreon 16", "1923 Ocean Ave"),
      Building(BuildingType.restaurant, "K\'s Kitchen", "K\'s Kitchen"),
      Building(BuildingType.restaurant, "Chaiya Thai Restaurant", "72 Claremont Blvd"),
      Building(BuildingType.restaurant, "La Ciccia", "291 30th St"),
    ];

    return MaterialApp(
      title: "ListViewDemo",
      home: Scaffold(
        appBar: AppBar(
          title: Text("building"),
        ),
        body: BuildingListView(buildings, (index) => debugPrint("item $index click")),
      ),
    );
  }
}

typedef OnItemClickListener = void Function(int position);

class BuildingListView extends StatelessWidget {
  final List<Building> buildings;

  final OnItemClickListener listener;

  BuildingListView(this.buildings, this.listener);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: buildings.length,
        itemBuilder: (context, index) {
          return ItemView(index, buildings[index], listener);
        });
  }
}

enum BuildingType {
  theater,
  restaurant,
}

class Building {
  final BuildingType type;
  final String address;
  final String title;

  Building(this.type, this.address, this.title);
}

class ItemView extends StatelessWidget {
  final int position;

  final Building building;

  final OnItemClickListener listener;

  ItemView(this.position, this.building, this.listener);

  @override
  Widget build(BuildContext context) {
    final icon = Icon(
      building.type == BuildingType.restaurant ? Icons.restaurant : Icons.theaters,
      color: Colors.blue[500],
    );
    final widget = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(16.0),
          child: icon,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              building.title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
            Text(building.address)
          ],
        ))
      ],
    );
    return InkWell(
      onTap: () => listener(position),
      child: widget,
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final titleSection = _TitleSection("Oeschinen Lake Campground", "Kandersteg, Switzerland", 41);

    final buttonSection = HomeWeight();

    final textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
          ''',
        softWrap: true,
      ),
    );

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
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}

Widget _buildButtonColumn(BuildContext context, IconData icon, String label) {
  final color = Theme.of(context).primaryColor;

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(
        icon,
        color: color,
      ),
      Container(
        margin: EdgeInsets.only(top: 8.0),
        child: Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      )
    ],
  );
}

class HomeWeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButtonColumn(context, Icons.call, "CALL"),
            _buildButtonColumn(context, Icons.near_me, "ROUTE"),
            _buildButtonColumn(context, Icons.share, "SHARE"),
          ],
        ),
      ),
    );
  }
}

class _TitleSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final int starCount;

  _TitleSection(this.title, this.subtitle, this.starCount);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 200,
      constraints: BoxConstraints.expand(),
      padding: EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 15, color: Colors.grey[500]),
              )
            ],
          )),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text(
            starCount.toString(),
            style: TextStyle(color: Colors.blue, fontSize: 13, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(-0.5, -0.5),
      children: <Widget>[
        Container(
          color: Colors.blue,
          width: 200.0,
          height: 200.0,
        ),
        Text("aaaa"),
        Text("bbbb")
      ],
    );
  }
}

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Container"),
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(20),
      width: 80,
      decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(5)),
    );
  }
}

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Row(
      children: <Widget>[Text("aaa"), Text("bbb"), Text("ddd"), ColumnWidget()],
    );
  }
}

class ColumnWidget extends StatelessWidget {
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
          style: TextStyle(color: Colors.orange, fontSize: 20),
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
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        content: Text(editController.text),
                        actions: <Widget>[FlatButton(onPressed: () => Navigator.pop(context), child: Text("OK"))],
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

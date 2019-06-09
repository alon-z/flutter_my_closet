import 'package:flutter/material.dart';
import '../widgets/drawerpanelitem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static List<Widget> _pages = [
    ListView(
      children: <Widget>[
        ExpansionPanelDrawerList()
      ],
    ),
    Center(child: Text("Page 2")),
    Center(child: Text("Settings")),
  ];

  void _onSelectedPage (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onSelectedPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text("Apartment")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("Settings")
          ),
      ]),
      body: _pages[_selectedIndex],
    );
  }
}

class ExpansionPanelDrawerList extends StatefulWidget {
  @override
  _ExpansionPanelDrawerListState createState() => _ExpansionPanelDrawerListState();
}

class _ExpansionPanelDrawerListState extends State<ExpansionPanelDrawerList> {

  List<DrawerPanelItem> _items = [];

  @override
  Widget build(BuildContext context) {
    _items = [
      DrawerPanelItem(body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          ListTile(
            title: Text("Uniform Shirt"),
            subtitle: Text("2 Units"),
            leading: Icon(Icons.work),
            onTap: () {
              showDialog(context: null,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: Text("Action"),
                      children: <Widget>[
                        SimpleDialogOption(
                            child: Text("Option 1")
                        )
                      ],
                    );
                  }
              );
            },
          ),
          ListTile(
            title: Text("Uniform Pants"),
            subtitle: Text("2 Units"),
            leading: Icon(Icons.work),
          ),
          ListTile(
            title: Text("Short Socks"),
            subtitle: Text("4 Pairs"),
            leading: Icon(Icons.directions_run),
          )
        ],
      )
          , header: Text("Upper Drawer")),
      DrawerPanelItem(body: Text("Body2"), header: Text("Bottom Drawer")),
    ];

    return ExpansionPanelList(
      expansionCallback: (int index, isExpended) {
        setState(() {
          _items[index].isExpended = !_items[index].isExpended;
        });
      },
      children: _items.map<ExpansionPanel>((DrawerPanelItem item) {
        return ExpansionPanel(
          isExpanded: item.isExpended,
          headerBuilder: (BuildContext context, isExpended) {
            return ListTile(
              title: item.header,
            );
          },
          body: item.body
        );
      },
    ).toList());
  }
}
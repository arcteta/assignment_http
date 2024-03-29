import 'package:assignment_http/service/api.dart';
import 'package:flutter/material.dart';


class MainScreenUI extends StatefulWidget {
  const MainScreenUI({super.key});

  @override
  State<MainScreenUI> createState() => _MainScreenUIState();
}

class _MainScreenUIState extends State<MainScreenUI> {
  @override
  Widget build(BuildContext context) {
    return WidgetBottomNavBar();
  }
}

class WidgetBottomNavBar extends StatefulWidget {
  const WidgetBottomNavBar({super.key});

  @override
  State<WidgetBottomNavBar> createState() => _WidgetBottomNavBarState();
}

class _WidgetBottomNavBarState extends State<WidgetBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    PostItem(),
    Text(
      'Index 1: menu 2',
      style: optionStyle,
    ),
    UsersBodyItem(),
  ];

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('HTTP - Assignment'),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Posts',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image_rounded),
            label: 'Photos',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'user',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class UsersBodyItem extends StatelessWidget {
  const UsersBodyItem({super.key});

  @override
  Widget build(BuildContext context) {
    //final newsProviders = Provider.of<AlbumProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: FutureBuilder(
                future: getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //print(snapshot.data?.length);
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Container(
                            color: Colors.grey.shade200,
                            child: Column(
                              children: [
                                Text(
                                  "${snapshot.data?[index].id! ?? '_'}",
                                  style: const TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                                Text(snapshot.data?[index].name! ?? '_'),
                                Text(snapshot.data?[index].username! ?? '_'),
                                Text(snapshot.data?[index].email! ?? '_'),
                                Text(
                                    "${snapshot.data?[index].address!.street ?? '_'}, ${snapshot.data?[index].address!.suite ?? '_'}, ${snapshot.data?[index].address!.city ?? '_'}, ${snapshot.data?[index].address!.zipcode ?? '_'} geo: ${snapshot.data?[index].address!.geo!.lat ?? '_'}, ${snapshot.data?[index].address!.geo!.lng ?? '_'}"),
                                Text(snapshot.data?[index].phone! ?? '_'),
                                Text(snapshot.data?[index].website! ?? '_'),
                                Text(
                                    "${snapshot.data?[index].company!.name ?? '_'}: ${snapshot.data?[index].company!.catchPhrase ?? '_'} (${snapshot.data?[index].company!.bs ?? '_'})"),
                                Container(
                                  height: 10,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Text("Snapshot Error");
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: FutureBuilder(
                future: getPostData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Container(
                            color: Colors.grey.shade200,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    snapshot.data?[index].title! ?? '_',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                    maxLines: 2,
                                  ),
                                  subtitle: Text(
                                    snapshot.data?[index].body! ?? '_',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                  leading: Text(
                                    "${snapshot.data?[index].id! ?? '_'}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      //fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 10,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Text("Snapshot Error");
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

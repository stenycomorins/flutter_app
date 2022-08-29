import 'package:flutter/material.dart';
import 'package:flutter_app/home/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      drawer: const DrawerScreen(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<HomeData>? recentFAs;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    getHomeData();
  }

  void getHomeData() async {
    prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    setState(() {
      recentFAs = fetchHomeData(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HomeData>(
      future: recentFAs,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: snapshot.data?.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Text("Float Advance",
                              style: TextStyle(fontSize: 20)),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("Float Advance"),
                                    Text("50,000UGX")
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text("Flow Fee"),
                                    Text("5000UGX")
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("Disbursal Date"),
                                    Text("Aug 22,2022")
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text("Duration"),
                                    Text("6 Days")
                                  ],
                                )
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                            child: const Text("Repeat FA",
                                style: TextStyle(color: Colors.black)),
                          )
                        ],
                      ),
                    ));
              });
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

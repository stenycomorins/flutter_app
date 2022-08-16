import 'package:flutter/material.dart';
import 'package:flutter_app/home/index.dart';

class HomeScreen extends StatefulWidget {
  final String accessToken;
  const HomeScreen({Key? key, required this.accessToken}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<HomeData> recentFAs;

  @override
  void initState() {
    super.initState();
    recentFAs = fetchHomeData(widget.accessToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("HomeScreen")),
      body: FutureBuilder<HomeData>(
        future: recentFAs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: snapshot.data?.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      // leading: CircleAvatar(
                      //   radius: 28,
                      //   backgroundImage:
                      //       NetworkImage(snapshot.data!.data[index].faId),
                      // ),
                      title: Text('FA ID: ${snapshot.data!.data[index].amt}'),
                      subtitle: Text(
                          'Amount: ${snapshot.data!.data[index].fee.toString()}'),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

// class _HomeScreenState extends State<HomeScreen> {
//   late Future<Userslistmodel> userslist;

//   @override
//   void initState() {
//     super.initState();
//     userslist = fetchUsersList(widget.accessToken);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(title: const Text("HomeScreen")),
//       body: FutureBuilder<Userslistmodel>(
//         future: userslist,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//                 padding: const EdgeInsets.all(8.0),
//                 itemCount: snapshot.data?.data.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Card(
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         radius: 28,
//                         backgroundImage:
//                             NetworkImage(snapshot.data!.data[index].avatar),
//                       ),
//                       title: Text(snapshot.data!.data[index].firstName +
//                           snapshot.data!.data[index].lastName),
//                       subtitle: Text(snapshot.data!.data[index].email),
//                     ),
//                   );
//                 });
//           } else if (snapshot.hasError) {
//             return Text('${snapshot.error}');
//           }
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }


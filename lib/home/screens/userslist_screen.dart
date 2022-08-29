import 'package:flutter/material.dart';
import 'package:flutter_app/home/index.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  late Future<Userslistmodel> userslist;

  @override
  void initState() {
    super.initState();
    userslist = fetchUsersList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("UsersList")),
      body: FutureBuilder<Userslistmodel>(
        future: userslist,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: snapshot.data?.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundImage:
                            NetworkImage(snapshot.data!.data[index].avatar),
                      ),
                      title: Text(snapshot.data!.data[index].firstName +
                          snapshot.data!.data[index].lastName),
                      subtitle: Text(snapshot.data!.data[index].email),
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

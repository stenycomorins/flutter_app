import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_app/home/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  Future<bool> onLogout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
                child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx5Li-cm5EBvX5WLKJ1eu7BFW8bg5hnGi_lw&usqp=CAU'),
              radius: 60,
            )),
          ),
          ListTile(
            title: const Text('UsersList'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, './userslist');
            },
          ),
          ListTile(
              title: const Text('TakePicture'),
              onTap: () async {
                Navigator.pop(context);
                await availableCameras().then((value) => Navigator.pushNamed(
                    context, TakePictureScreen.routeName,
                    arguments: value));
              }),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              onLogout().then((value) => {
                    if (value) {Navigator.pushReplacementNamed(context, '/')}
                  });
              // ;
              // ;
            },
          )
        ],
      ),
    );
  }
}

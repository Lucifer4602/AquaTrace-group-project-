// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  // sign out

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Sunandhit"),
            accountEmail: Text(user.email!),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/sunandhitCharacter.png'),
              backgroundColor: Colors.transparent,
              radius: 25,
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  image: AssetImage('assets/bgProfile.png'), fit: BoxFit.cover),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.favorite_outline_outlined),
            title: Text("Favourite"),
            // onTap: (){},
          ),
          const ListTile(
            leading: Icon(Icons.people),
            title: Text("Friends"),
            // onTap: (){},
          ),
          const ListTile(
            leading: Icon(Icons.share),
            title: Text("Share"),
            // onTap: (){},
          ),
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Request"),
            // onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: signUserOut,
          ),
        ],
      ),
    );
  }
}

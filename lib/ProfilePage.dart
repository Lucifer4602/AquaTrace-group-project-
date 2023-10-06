

import 'package:flutter/material.dart';
class ProfilePage extends StatefulWidget {
   const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white60,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,width: 2),
             const Center(
              child: CircleAvatar(
                      backgroundImage: AssetImage('assets/sunandhitCharacter.png'),
                      backgroundColor: Colors.transparent,
                      radius: 85,
                    ),
                    
            ),
            
            const SizedBox(height: 40,width: 3,),
            ListTile(
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.person),highlightColor:Colors.white38,),
              title: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Sunandhit Gupta",
                  label: Text("User Name"),
                ),
              ),
            ),
          
            SizedBox(height: 5,width: 3,),
            ListTile(
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.email),highlightColor: Colors.white38,),
              title: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "sunandhitgupta@gmail.com",
                  label: Text("Email"),
                ),
              ),
            ),
          
            SizedBox(height: 40,width: 20,),
            ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.save,color: Colors.white,), label: Text("Save"),style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 101, 139, 158)),),
          ],
        ),
      ),
    );
  }
}
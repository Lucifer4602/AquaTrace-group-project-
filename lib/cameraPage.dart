import 'package:aqua_trace/ProfilePage.dart';
import 'package:aqua_trace/Tips.dart';
import 'package:aqua_trace/drawer.dart';
import 'package:aqua_trace/list.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:aqua_trace/textfield.dart';

class cameraPage extends StatefulWidget {
  cameraPage({super.key});
  @override
  State<cameraPage> createState() => _cameraPageState();
}

int myIndex = 2;

List<Widget> widgetList = [
  list(),
  TextWidget(),
  Text('Camera'),
  Tips(),
  ProfilePage(),
];

class _cameraPageState extends State<cameraPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawer(),
        appBar: myIndex != 3
            ? AppBar(
                // ---------------making leading Icon for Logout ( not used )-------------------
                // leading: IconButton(
                //     onPressed: () {
                //       Get.back();
                //     },
                //     icon: const Icon(Icons.logout_outlined)),

                title: Text("Hello, "),
                centerTitle: true,
                actions: [
                  // -------------------Making button of Avatar--------------
                  FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      // --------------------------------------Showing Bottom upsliding window----------------------------
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return const Scaffold(
                              backgroundColor:
                                  Color.fromARGB(255, 152, 173, 209),
                              body: Center(
                                  child: Text(
                                "Hello",
                                style: TextStyle(fontSize: 20),
                              )),
                            );
                          });
                    },
//  ----------------------------------Making profile Avatar------------------------------------
                    child: const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/sunandhitCharacter.png'),
                      backgroundColor: Colors.transparent,
                      radius: 25,
                    ),
                  ),
                ],
              )
            : null,
        body: Column(
          children: [
            const SizedBox(
              height: 2,
              width: 2,
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                //------------------------------ Giving Screens as input to change with NAVBAR----------------
                child: IndexedStack(
                  index: myIndex,
                  children: widgetList,
                ),
              ),
            ),
          ],
        ),

// ----------------------Making bottom navigation Bar (right now not used)----------------------------

        //   bottomNavigationBar:Container(
        //   decoration: const  BoxDecoration(
        //     boxShadow: <BoxShadow>[
        //       BoxShadow(
        //         color: Colors.black,
        //         blurRadius: 10,
        //       ),
        //     ],
        //   ),
        //   child: BottomNavigationBar(
        //     elevation: 10,
        //     enableFeedback: true,
        //       type: BottomNavigationBarType.shifting,
        //       onTap: (index) {
        //         setState(() {
        //           myIndex = index;
        //         });
        //       },
        //       currentIndex: myIndex,
        //       items: const [
        //         BottomNavigationBarItem(
        //             icon: Icon(Icons.home),
        //             label: "Home",
        //             backgroundColor: Colors.amber,
        //             ),
        //         BottomNavigationBarItem(
        //             icon: Icon(Icons.text_fields),
        //             label: "Text",
        //             backgroundColor: Colors.amber),
        //         BottomNavigationBarItem(
        //             icon: Icon(Icons.calculate),
        //             label: "Calculator",
        //             backgroundColor: Colors.amber),
        //         BottomNavigationBarItem(
        //             icon: Icon(Icons.camera_alt),
        //             label: "Camera",
        //             backgroundColor: Colors.amber),
        //         BottomNavigationBarItem(
        //             icon: Icon(Icons.person_2),
        //             label: "Profile",
        //             backgroundColor: Colors.amber),
        //       ]),
        // ),

        // -----------------------making curved  NavBar--------------------------

        bottomNavigationBar: CurvedNavigationBar(
            color: Colors.blue,
            backgroundColor: Colors.transparent,
            height: 70,
            index: 2,
            onTap: (index) {
              setState(() {
                myIndex = index;
              });
            },
            items: const [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    color: Colors.black,
                    Icons.calculate,
                    size: 30,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    color: Colors.black,
                    Icons.text_fields_outlined,
                    size: 30,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    color: Colors.black,
                    Icons.camera_alt_rounded,
                    size: 30,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    color: Colors.black,
                    Icons.tips_and_updates,
                    size: 30,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    color: Colors.black,
                    Icons.person,
                    size: 30,
                  )
                ],
              ),
            ]),
      ),
    );
  }
}

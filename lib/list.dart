// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aqua_trace/provider_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class list extends StatefulWidget {
  const list({Key? key}) : super(key: key);

  @override
  State<list> createState() => listState();
}

class listState extends State<list> {
  String text = "";
  @override
  Widget build(BuildContext context) {
    
    return Consumer<listProvider>(
      builder: (context, listProviderModel, child) => Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: listProviderModel.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.amber,
                    elevation: 5,
                    child: ListTile(
                      title: Text(listProviderModel.data[index]),
                      trailing: SizedBox(
                        width: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: IconButton(
                                    onPressed: () {
                                      // setState(() {
                                      // listProviderModel.data.removeAt(index);
                                      listProviderModel.remove(index);
                                      // });
                                    },
                                    icon: Icon(Icons.delete)))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
              child: Divider(
                color: Colors.grey,
                thickness: 3,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(35.0, 15.0, 35.0, 0.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'total',
                    ),
                  ),
                  Card(
                    color: Colors.amberAccent,
                    child: Expanded(
                      child: Text(
                        'number',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,width: 20,)
          ],
        ),
      ),
    );
  }
}

import 'package:aqua_trace/provider_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TextWidget extends StatefulWidget {
  @override
  _TextIn createState() => _TextIn();
}

class _TextIn extends State<TextWidget> {
  // List to store items
  List<String> items = [];
  List<String> listItems = ['apple', 'bananana', 'book'];

  var temp = '';
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<listProvider>(
      builder: (context, listProviderModel, child) {
        List<String> list_num = List<String>.generate(
            5 + listProviderModel.data.length, (i) => '$i');

        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 260,
                      height: 50,
                      child: Center(
                        child: Autocomplete<String>(
                          optionsBuilder: (TextEditingValue textinput) {
                            temp = textinput.text;
                            if (textinput.text == '') {
                              return const Iterable<String>.empty();
                            }
                            return listItems.where((String item) {
                              return item
                                  .contains(textinput.text.toLowerCase());
                            });
                          },
                          fieldViewBuilder: (context, controller, focusNode,
                              onEditingComplete) {
                            return TextField(
                              controller: controller,
                              focusNode: focusNode,
                              onEditingComplete: onEditingComplete,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  // Text field for input

                  // Button to add to the list

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        height: 50,
                        width: 70,
                        child: TextButton(
                          onPressed: () {
                            String newItem = temp.trim();
                            if (newItem.isNotEmpty) {
                              // setState(
                              //   () {
                              // items.add(newItem);
                              listProviderModel.add(newItem);

                              textController.clear();
                              //   // },
                              // );
                            }
                          },
                          child: Text('+'),
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            // List to display items
            Expanded(
              child: ListView.builder(
                // itemCount: items.length,
                itemCount: listProviderModel.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        //<-- SEE HERE
                        side: BorderSide(width: 2, color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(
                          list_num[index + 1],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      title: Text(
                          // '${items[index]}',
                          listProviderModel.data[index]),
                      trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // setState(() {
                            // items.remove(items[index]);
                            listProviderModel.remove(index);
                            // });
                          }),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

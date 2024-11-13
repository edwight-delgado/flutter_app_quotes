import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import 'dart:convert';
import '../widgets/app_bar_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/bottomNavigationBarWidget.dart';

class ListByAuthor extends StatefulWidget {
  ListByAuthor({super.key, required this.param});
  String param;
  @override
  State<ListByAuthor> createState() => _ListByAuthorState();
}

class _ListByAuthorState extends State<ListByAuthor> {
  List<dynamic> _items = [];
  Future<void> readJsonPhrase(param) async {
    final String response = await rootBundle.loadString('assets/phrase.json');
    final data = await json.decode(response);
    List newdata =
        data["body"].where((item) => item['author'] == param).toList();
    setState(() {
      _items = newdata;
      //print(_items);
    });

    //print(autor);
  }

  @override
  Widget build(BuildContext context) {
    readJsonPhrase(widget.param);
    return Scaffold(
      appBar: AppBarWidget(param: widget.param),
      drawer: DrawerWidget(),
      body: Container(
          padding: EdgeInsets.only(left: 10.0),
          child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  minVerticalPadding: 15,
                  title: Text(_items[index]['phrase']),
                  trailing: IconButton(
                      icon: Icon(Icons.copy),
                      onPressed: (() async {
                        //print('click');
                        await Clipboard.setData(ClipboardData(
                            text:
                                "${_items[index]['phrase']} - ${_items[index]['author']}"));
                        //showToast("Frase copiada", context: context);
                      })),
                );
              }))),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            color: Color.fromARGB(94, 0, 0, 0),
            child: IconButton(
              icon: Icon(Icons.home),
              onPressed: (() {
                Navigator.pushNamed(context, "/");
              }),
            ),
          )
        ],
      ),
    );
  }
}

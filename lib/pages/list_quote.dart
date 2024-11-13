import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotes/pages/list_by_author.dart';
import 'dart:convert';
import '../widgets/app_bar_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/bottomNavigationBarWidget.dart';

class ListQuote extends StatefulWidget {
  ListQuote({super.key, required this.param});
  String param;
  @override
  State<ListQuote> createState() => _ListQuoteState();
}

class _ListQuoteState extends State<ListQuote> {
  List<dynamic> _items = [];
  Future<void> readJsonPhrase(param) async {
    final String response = await rootBundle.loadString('assets/phrase.json');
    final data = await json.decode(response);
    List newdata = data["body"].where((item) => item['tag'] == param).toList();
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
                  title: Text(_items[index]['author']),
                  subtitle: Text("sobre ${_items[index]['tag']}"),
                  trailing: IconButton(
                      icon: Icon(Icons.arrow_right_outlined),
                      onPressed: (() {
                        //print('click');
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                ListByAuthor(param: _items[index]['author']),
                          ),
                        );
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

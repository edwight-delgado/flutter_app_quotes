import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
//import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import './widgets/app_bar_widget.dart';
import './widgets/drawer_widget.dart';

//import 'package:quotes/model/phrase.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  //get phasses

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String autor = "loading author";
  String phrase = "loading quote";
  String image = "BobbyFischer400x400_7.jpg";

  Future<void> readJsonPhrase() async {
    List<dynamic> _items = [];
    dynamic _item;
    final String response = await rootBundle.loadString('assets/phrase.json');
    final data = await json.decode(response);
    _items = data["body"];
    int randomValue = Random().nextInt(_items.length);
    _item = _items[randomValue];
    setState(() {
      _items = data["body"];

      autor = _item['author'];
      phrase = _item['phrase'];
      image = _item['image'];
    });
    //print(autor);
  }

  //print(jsonData);
  //print(autor);
  //result = Phrase(phrase: jsonData['phrase'], author: jsonData['author']);

  //return Phrase(phrase: jsonData['phrase'], author: jsonData['author']);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //print('didChangeDependencies, montado:  ');
    readJsonPhrase();
  }

  @override
  Widget build(BuildContext context) {
    //readJsonPhrase();
    //initState();
    return Scaffold(
      appBar: AppBarWidget(param: "Celebres"),
      drawer: DrawerWidget(),
      body: Stack(children: [
        Image.asset(
          'assets/images/$image',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Container(
          //color: Colors.black26,
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(0, 250, 250, 250),
              Color.fromARGB(240, 82, 75, 100),
            ],
          )),
        ),
        Padding(
            padding: EdgeInsets.only(bottom: 40, left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(text: '“', style: TextStyle(fontSize: 40)),
                    TextSpan(
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                            fontFamily: "Ic"),
                        text: "  $phrase "),
                    const TextSpan(text: '“', style: TextStyle(fontSize: 40)),
                  ],
                )),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                    text: TextSpan(
                        text: " $autor ",
                        style: const TextStyle(fontSize: 20))),
              ],
            )),
      ]),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            color: Color.fromARGB(94, 0, 0, 0),
            child: IconButton(
              icon: Icon(Icons.sync),
              onPressed: (() {
                Navigator.pushNamed(context, "/");
              }),
            ),
          ),
          Container(
            color: Color.fromARGB(94, 0, 0, 0),
            child: IconButton(
                icon: Icon(Icons.copy),
                onPressed: (() async {
                  //print('click');
                  await Clipboard.setData(
                      ClipboardData(text: "$phrase  -  $autor"));

                  //showToast("Frase copiada", context: context);
                })),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:todo_list/CustomBar/custom_appbar.dart';
import 'package:todo_list/Pages/add_items.dart';
import 'package:todo_list/Pages/items_lists.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _items = [];

  void _addItems(String item) {
    setState(() {
      _items.add(item);
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => ItemsLists(items: _items)));
      final snackBar = SnackBar(
        content: const Text("Your Item Added"),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(label: 'Undo', onPressed: () {}),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Add Items",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddItems(
                                        additemsCallback: _addItems,
                                      )));
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 30, // Customize icon size
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "View Items",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ItemsLists(
                                        items: _items,
                                      )));
                        },
                        icon: const Icon(
                          Icons.list,
                          size: 30, // Customize icon size
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

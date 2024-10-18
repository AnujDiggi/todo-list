import 'package:flutter/material.dart';
import 'package:todo_list/CustomBar/custom_appbar.dart';
import 'package:todo_list/CustomBar/custom_bottomNavigation.dart';

class AddItems extends StatefulWidget {
  final Function(String) additemsCallback;
  const AddItems({super.key, required this.additemsCallback});

  @override
  // ignore: library_private_types_in_public_api
  _AddItemsState createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: const Text(
                    "Add Item",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  )),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                      labelText: "Todo Items",
                      border: OutlineInputBorder(),
                      focusColor: Colors.indigo),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      widget.additemsCallback(_controller.text);
                      Navigator.pop(context);
                    }
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text(
                    'Add Items',
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(currentIndex: 1),
    );
  }
}

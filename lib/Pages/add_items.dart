import 'package:flutter/material.dart';
import 'package:todo_list/CustomBar/custom_appbar.dart';

class AddItems extends StatefulWidget {
  final String additems;
  const AddItems({super.key, required this.additems});

  @override
  // ignore: library_private_types_in_public_api
  _AddItemsState createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {

  //final TextEditingController _controller = TextEditingController();

  void _submit() {
      print("Submit");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Center(
           child: Container(
              margin: const EdgeInsets.all(10),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
               const TextField(
                  // controller: _controller,
                  decoration: InputDecoration(labelText: "Todo Items"),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: _submit, child: const Text('Add Items'))
               ],
             ),
           ),
        ),
    );
  }
}
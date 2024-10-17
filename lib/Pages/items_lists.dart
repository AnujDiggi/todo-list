import 'package:flutter/material.dart';
import 'package:todo_list/CustomBar/custom_appbar.dart';

class TodoItem {
  String title;
  bool isComplete;

  TodoItem({required this.title, this.isComplete = false});
}

class ItemsLists extends StatefulWidget {
  final List<TodoItem> items;

  const ItemsLists({super.key, required this.items});

  @override
  // ignore: library_private_types_in_public_api
  _ItemsListsState createState() => _ItemsListsState();
}

class _ItemsListsState extends State<ItemsLists> {
  void _toggleComplete(int index) {
    setState(() {
      widget.items[index].isComplete = !widget.items[index].isComplete;
    });
  }

  // Delete an item
  void _delete(int index) {
    setState(() {
      widget.items.removeAt(index);
    });
  }

  // Update an item
  void _updateItem(int index, String newTitle) {
    setState(() {
      widget.items[index].title = newTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text("View Lists"),
      ),
    );
  }
}

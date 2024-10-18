import 'package:flutter/material.dart';
import 'package:todo_list/CustomBar/custom_appbar.dart';
import 'package:todo_list/CustomBar/custom_bottomNavigation.dart';

class ItemsLists extends StatefulWidget {
  final List<String> items;

  const ItemsLists({super.key, required this.items});

  @override
  // ignore: library_private_types_in_public_api
  _ItemsListsState createState() => _ItemsListsState();
}

class _ItemsListsState extends State<ItemsLists> {
  List<bool> _isCompleted = [];

  // ignore: annotate_overrides
  void initState() {
    super.initState();
    _isCompleted = List<bool>.filled(widget.items.length, false);
  }

  void _toggleComplete(int index) {
    setState(() {
      _isCompleted[index] = !_isCompleted[index];
    });
  }

  // Delete an item
  void _delete(int index) {
    setState(() {
      widget.items.removeAt(index);
      _isCompleted.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: widget.items.isEmpty
          ? const Center(
              child: Text("No Item added yet!"),
            )
          : ListView.builder(
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    widget.items[index],
                    style: TextStyle(
                      decoration: _isCompleted[index]
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            _toggleComplete(index);
                          },
                          icon: Icon(_isCompleted[index]
                              ? Icons.check_box
                              : Icons.check_box_outline_blank)),
                      IconButton(
                          onPressed: () {
                            _delete(index);
                          },
                          icon: const Icon(Icons.delete))
                    ],
                  ),
                );
              }),
      bottomNavigationBar: const CustomBottomNavigation(currentIndex: 1),
    );
  }
}

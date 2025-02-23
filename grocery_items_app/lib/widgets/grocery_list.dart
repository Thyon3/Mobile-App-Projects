import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grocery_items_app/models/grocery_item.dart';
import 'package:grocery_items_app/data/dummy_itmes.dart';
import 'package:grocery_items_app/widgets/new_item.dart';
import 'package:grocery_items_app/widgets/grocery_list.dart';

class GroceryList extends StatefulWidget {
  GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];

  void addItem() async {
    // accepting teh new Item from the new_item.dart and storing it inside of newItem variable
    final newItem = await Navigator.of(context)
        .push<GroceryItem>(MaterialPageRoute(builder: (context) => NewItem()));

    // add the new item if it is not null
    if (newItem == null) {
      return;
    } else {
      setState(() {
        _groceryItems.add(newItem);
      });
    }
  }

  // remove item

  void _removeItem(GroceryItem itme) {
    setState(() {
      _groceryItems.remove(itme);
    });
  }

  Widget build(context) {
    Widget mainContent = const Center(
      child: Text('you have not Grocery Item Try to add some'),
    );

    if (_groceryItems != null) {
      mainContent = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(_groceryItems[index].id),
          onDismissed: (direction) {
            _removeItem(_groceryItems[index]);
          },
          child: ListTile(
            title: Text(_groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItems[index].category.color,
            ),
            trailing: Text(
              _groceryItems[index].quantity.toString(),
            ),
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Groceries'),
          actions: [
            IconButton(onPressed: addItem, icon: Icon(Icons.add)),
          ],
        ),
        body: mainContent);
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grocery_items_app/data/categories.dart';
import 'package:grocery_items_app/models/grocery_item.dart';
import 'package:grocery_items_app/data/dummy_itmes.dart';
import 'package:grocery_items_app/widgets/new_item.dart';
import 'package:grocery_items_app/widgets/grocery_list.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  var isLoading = true;
  String? _error;
  List<GroceryItem> _groceryItems = [];
  // call the loadItems function inside of the initstate cause it is some intialization work

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    //  create a new url to the firebase database
    final url = Uri.https('grocery-items-app-5cefe-default-rtdb.firebaseio.com',
        ' grocery_items.json');

    // so we can use a try catch block for error handling

    try {
      //use the get method to extrace the data from the database and we have to store the data came back to use it
      final response = await http.get(url);
      // manage errors when something is wrong during fetching data
      if (response.statusCode >= 400) {
        setState(() {
          _error = 'failed to fetch data! please try again later';
        });
      }
      //
      if (response.body == 'null') {
        setState(() {
          isLoading =
              false; // cause we have done fetching data it has already returned a null value
        });
        return;
      }
      final Map<String, dynamic> ListData = json.decode(response.body);
      final List<GroceryItem> _loadedItems = [];
      for (final item in ListData.entries) {
        final category = categories.entries
            .firstWhere(
                (element) => element.value.name == item.value['category'])
            .value;
        _loadedItems.add(GroceryItem(
            id: item.key,
            category: category,
            quantity: item.value['quantity'],
            name: item.value['name']));
      }
      setState(() {
        _groceryItems = _loadedItems;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        _error = 'failed to fetch data! please try again later';
      });
    }
  }

  void addItem() async {
    // accepting teh new Item from the new_item.dart and storing it inside of n2ewItem variable
    final newItem =
        await Navigator.of(context).push<GroceryItem>(MaterialPageRoute(
            builder: (context) => NewItem(
                  loadItems: _loadItems,
                )));

    // add the new item if it is not null
    if (newItem == null) {
      return;
    } else {
      setState(() {
        _groceryItems.add(newItem);
      });
    }
    _loadItems();
  }

  // remove item

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  Widget build(context) {
    Widget mainContent = const Center(
      child: Text('you have not Grocery Item Try to add some'),
    );
    if (isLoading) {
      mainContent = Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_error != null) {
      mainContent = Center(
        child: Text(_error!),
      );
    }

    if (_groceryItems.isNotEmpty) {
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

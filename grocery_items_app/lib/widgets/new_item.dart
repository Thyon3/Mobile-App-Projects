import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_items_app/data/categories.dart';
import 'package:grocery_items_app/models/category.dart';
import 'package:http/http.dart' as http;

class NewItem extends StatefulWidget {
  NewItem({required this.loadItems, super.key});
  final void Function() loadItems;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  // declaring intial values for the selected items
  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;
  var isSending = false;
  //function for submit the form
  void _saveItem() async {
    // save the currentState if the form is valid only
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        isSending = true;
      });
      final url = Uri.https(
          'grocery-items-app-5cefe-default-rtdb.firebaseio.com',
          ' grocery_items.json');
      final response = await http.post(url,
          headers: {'Content-Type': 'application/jason'},
          body: json.encode({
            'category': _selectedCategory.name,
            'quantity': _enteredQuantity,
            'name': _enteredName
          }));

      print(response.body);
      print(response.statusCode);

      if (!context.mounted) {
        return;
      }

      Navigator.pop(context);
      widget.loadItems();
    }
  }

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: InputDecoration(label: const Text("Name")),
                  onSaved: (value) {
                    _enteredName = value!;
                  },
                  validator: (value) {
                    // checking whethere the user's input is valid or not
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return 'Your Input should be Between 1 and 50 Characters';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          // checking whethere the user's input is valid or not
                          if (value == null ||
                              value.isEmpty ||
                              int.tryParse(value) == null ||
                              int.tryParse(value)! <= 0) {
                            return 'Your Input should be a Positive Integer';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text('Quantity'),
                        ),
                        onSaved: (value) {
                          _enteredQuantity = int.tryParse(value!)!;
                        },
                        initialValue: '1',
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: DropdownButtonFormField(
                          items: [
                            for (final category in categories.entries)
                              DropdownMenuItem(
                                  value: category.value,
                                  child: Row(children: [
                                    Container(
                                      width: 16,
                                      height: 16,
                                      color: category.value.color,
                                    ),
                                    SizedBox(width: 8),
                                    Text(category.value.name),
                                  ]))
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedCategory = value!;
                            });
                          }),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: isSending
                            ? null
                            : () {
                                _formKey.currentState!
                                    .reset(); //built in function to reset the values
                              },
                        child: Text('Reset')),
                    ElevatedButton(
                        // we want to disable the buttons while the data is being sent to the server

                        onPressed: isSending ? null : _saveItem,
                        child: isSending
                            ? SizedBox(
                                width: 10,
                                height: 10,
                                child: CircularProgressIndicator(),
                              )
                            : Text('Submit'))
                  ],
                )
              ],
            )),
      ),
    );
  }
}

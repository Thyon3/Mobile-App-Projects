import 'package:flutter/material.dart';
import 'package:grocery_items_app/data/categories.dart';
import 'package:grocery_items_app/models/category.dart';
import 'package:grocery_items_app/models/grocery_item.dart';

class NewItem extends StatefulWidget {
  NewItem({super.key});

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

  //function for submit the form
  void _saveItem() {
    // save the currentState if the form is valid only
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(_enteredName);
      print(_enteredQuantity);
    }
    Navigator.of(context).pop(GroceryItem(
        // passing the new item that is created to the GroceryList() class
        id: DateTime.now().toString(),
        category: _selectedCategory,
        quantity: _enteredQuantity,
        name: _enteredName));
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
                        onPressed: () {
                          _formKey.currentState!
                              .reset(); //built in function to reset the values
                        },
                        child: Text('Reset')),
                    ElevatedButton(onPressed: _saveItem, child: Text('Submit'))
                  ],
                )
              ],
            )),
      ),
    );
  }
}

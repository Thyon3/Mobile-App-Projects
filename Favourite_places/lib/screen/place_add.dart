import 'package:expense_tracker_mobile_app/main.dart';
import 'package:expense_tracker_mobile_app/providers/user_place_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceAdd extends ConsumerStatefulWidget {
  PlaceAdd({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PlaceAddState();
  }
}

class _PlaceAddState extends ConsumerState<PlaceAdd> {
  final _textController = TextEditingController();

  // we have to use the dispose method

  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _savePlace() {
    String _enteredPlaceTitle = _textController.text;

    if (_enteredPlaceTitle.isEmpty) {
      return;
    }
    // now we want to add the new place using the provider

    ref.read(userPlaceProvider.notifier).addPlace(_enteredPlaceTitle);

    Navigator.of(context).pop();
  }

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new Place'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(label: Text('Title: ')),
              maxLength: 80,
              controller: _textController,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: colorScheme.onPrimaryContainer,
                  ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton.icon(
              onPressed: () {
                _savePlace();
              },
              label: Text('Add'),
              icon: Icon(Icons.fire_truck_rounded),
            )
          ],
        ),
      ),
    );
  }
}

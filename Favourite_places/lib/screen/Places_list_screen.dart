import 'package:expense_tracker_mobile_app/models/place.dart';
import 'package:expense_tracker_mobile_app/providers/user_place_provider.dart';
import 'package:expense_tracker_mobile_app/screen/place_add.dart';
import 'package:expense_tracker_mobile_app/widget/places_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_mobile_app/screen/Places_list_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesListScreen extends ConsumerWidget {
  void addPlace(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => PlaceAdd()));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userPlaces = ref.watch(userPlaceProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your places'),
        actions: [
          IconButton(
              onPressed: () {
                addPlace(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: PlacesList(
        placesList: userPlaces,
      ),
    );
  }
}

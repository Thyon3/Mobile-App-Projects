//  add the riverpod package

import 'package:expense_tracker_mobile_app/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlaceProviderNotifier extends StateNotifier<List<Place>> {
  UserPlaceProviderNotifier() : super(const []);

  void addPlace(String title) {
    var newPlace = Place(title: title);

    state = [newPlace, ...state]; //adding a new place to already existed state
  }
}

// creating the provider varibale
final userPlaceProvider =
    StateNotifierProvider<UserPlaceProviderNotifier, List<Place>>((ref) {
  return UserPlaceProviderNotifier();
});

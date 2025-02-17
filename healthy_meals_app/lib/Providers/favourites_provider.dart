import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthy_meals_app/Models/meal.dart';

// have a class that extends the StateNotifier class

class FavouritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavouritesMealsNotifier() : super([]);

  // define all the functions that bring change to this List<Meal>

  bool toggleMealFavouriteStatus(Meal meal) {
    final mealIsFavourite = state.contains(meal);

    if (mealIsFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
      return true;
    } else {
      state = [...state, meal];
      return false; // this is how we can add the new meal to the rest of the meals that were there
    }
  }
}

// for sort of data that can change we should use the StateNotifierProvide class from the flutter_riverpod.dart file
final favouriteMealsProvider =
    StateNotifierProvider<FavouritesMealsNotifier, List<Meal>>((ref) {
  return FavouritesMealsNotifier();
});

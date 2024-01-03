import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealNotifier() : super([]);

  void toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state
          .where((m) => m.id != meal.id)
          .toList(); // filter out the meal from the list and create a new list without the meal that was removed from favorites
    } else {
      state = [
        ...state,
        meal
      ]; // spread operator to create a new list with the added meal
    }
  }
}

// Create a provider for the favorite meal list that will be used in the app to manage the list of favorite meals in the app and toggle the favorite status of a meal in the list when the user clicks on it in the list of favorite meals
final favoriteMealProvider =
    StateNotifierProvider<FavoriteMealNotifier, List<Meal>>(
  (ref) => FavoriteMealNotifier(),
);

import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:zesty/model/meal.dart';

class MealModel extends Model {
  List<Meal> _meals = [];
  bool _isLoading = false;

  List<Meal> get meals {
    return _meals;
  }

  bool get isLoading {
    return _isLoading;
  }

  void fetchMeals() async {
    try {
      http.Response response =
          await http.get('http://163.17.135.152/Zesty/public/api/index');
      if (response.statusCode == 200 || response.statusCode == 201) {
        // 1. Create a List of Users
        final List<Meal> fetchedMealList = [];
        // 2. Decode the response body
        Map<String, dynamic> map = jsonDecode(response.body);
        List<dynamic> responseData = map['data'];
        // 3. Iterate through all the users in the list
        responseData?.forEach((dynamic mealData) {
          // 4. Create a new user and add to the list
          final Meal meal = Meal(
            mealData['id'],
            mealData['name'],
            // mealData['description'],
            // mealData['maximum_people'],
            // mealData['minimum_people'],
            mealData['price'],
            // mealData['remarks'],
            // mealData['category_id'],
            // mealData['created_at'],
            // mealData['updated_at'],
            mealData['category_name'],
            mealData['path'],
            mealData['chef_name'],
            mealData['stars'],
          );
          fetchedMealList.add(meal);
        });
        // 5. Update our list and the UI
        _meals = fetchedMealList;
        notifyListeners();
      }
    } catch (error) {
      print(error);
    }
  }
}

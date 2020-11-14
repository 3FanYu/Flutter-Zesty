import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:zesty/model/meal_detail.dart';

class MealDetailModel extends Model {
  List<MealDetail> _meals = [];
  bool _isLoading = false;

  List<MealDetail> get meals {
    return _meals;
  }

  bool get isLoading {
    return _isLoading;
  }

  void fetchMealDetails(int id) async {
    try {
      http.Response response =
          await http.get('http://163.17.135.152/Zesty/public/api/menus/'+id.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        // 1. Create a List of Users
        final List<MealDetail> fetchedMealList = [];
        // 2. Decode the response body
        Map<String, dynamic> map = jsonDecode(response.body);
        List<dynamic> responseData = map['data'];
        
        // 3. Iterate through all the users in the list
        responseData?.forEach((dynamic mealData) {
          // 4. Create a new user and add to the list;
          final MealDetail meal = MealDetail(
            id: mealData['id'],
            mealName: mealData['name'],
            price: mealData['price'],
            postSciprt: mealData['postscript'],
            categoryName: mealData['category'],
            chefName: mealData['chef_name'],
            chefImage: mealData['chef_image'],
            vegan: mealData['is_vegetarian'],
            devices: new List<String>.from(mealData['devices']),
            allergyFoods: new List<String>.from(mealData['allergy_foods']),
            menuDetails: List<MenuDetails>.from(
                mealData['menu_details'].map((x) => MenuDetails.fromJson(x))),
          );
          fetchedMealList.add(meal);
          // print(meal.menuDetails);
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

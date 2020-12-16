import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:zesty/model/meal.dart';
import 'package:zesty/model/wish.dart';

class WishModel extends Model {
  List<Wish> _meals = [];
  bool _isLoading = false;

  List<Wish> get meals {
    return _meals;
  }

  bool get isLoading {
    return _isLoading;
  }

  void fetchWishes() async {
    try {
      http.Response response =
          await http.get('http://163.17.135.152/Zesty/public/api/wishes');
      if (response.statusCode == 200 || response.statusCode == 201) {
        // 1. Create a List of Users
        final List<Wish> fetchedMealList = [];
        // 2. Decode the response body
        Map<String, dynamic> map = jsonDecode(response.body);
        print(jsonDecode(response.body));
        List<dynamic> responseData = map['data'];
        // 3. Iterate through all the users in the list
        responseData?.forEach((dynamic mealData) {
          // 4. Create a new user and add to the list
          final Wish meal = Wish(
            id:mealData['id'],
            name:mealData['name'],
            price:mealData['price'],
            categoryName:mealData['category_name'],
            path:mealData['path'],
            userName:mealData['user_name'],
            userDetailId: mealData['user_detail_id'],
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

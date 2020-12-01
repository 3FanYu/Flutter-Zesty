import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:zesty/scoped_model/meal_model.dart';
import '../service_locator.dart';
import 'list_meal.dart';

class WishHomeBody extends StatefulWidget {
  const WishHomeBody({Key key}) : super(key: key);

  @override
  _WishHomeBodyState createState() => _WishHomeBodyState();
}

class _WishHomeBodyState extends State<WishHomeBody>
    with AutomaticKeepAliveClientMixin<WishHomeBody> {
  bool keepAlive = false;
  MealModel mealModel;
  @override
  void initState() {
    super.initState();
    mealModel = locator<MealModel>();
    mealModel.fetchMeals();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MealModel>(
      model: mealModel,
      child: ScopedModelDescendant<MealModel>(
        builder: (BuildContext context, Widget child, MealModel model) {
          Widget content = Text('No meals');
          if (model.isLoading) {
            content = Center(
              child: CircularProgressIndicator(),
            );
          } else if (!model.isLoading && model.meals.length > 0) {
            content = _buildListView(model);
            keepAlive = true;
            updateKeepAlive();
          } else if (!model.isLoading && model.meals.length == 0) {
            keepAlive = false;
            updateKeepAlive();
          }
          return content;
        },
      ),
    );
  }

  Widget _buildListView(MealModel model) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      itemBuilder: (BuildContext context, int index) {
        return MealList(
          id: model.meals[index].id,
          title: model.meals[index].name,
          chefName: model.meals[index].chefName,
          categoryName: model.meals[index].categoryName,
          path: model.meals[index].path,
          stars: model.meals[index].stars,
          backgroundColor: Hexcolor('#FFFFFF'),
        );
      },
      itemCount: model.meals.length,
    );
  }

  @override
  bool get wantKeepAlive => keepAlive;
}

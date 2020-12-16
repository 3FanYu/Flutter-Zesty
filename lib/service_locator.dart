import 'package:get_it/get_it.dart';
import 'package:zesty/scoped_model/meal_detail_model.dart';
import 'package:zesty/scoped_model/meal_model.dart';
import 'package:zesty/scoped_model/meal_send_order_model.dart';
import 'package:zesty/scoped_model/wish_model.dart';
import 'package:zesty/scoped_model/wishadd_menu_model.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerFactory<MealModel>(() => MealModel());
  locator.registerFactory<MealDetailModel>(() => MealDetailModel());
  locator.registerFactory<SendOrderModel>(() => SendOrderModel());
  locator.registerFactory<AddMenuModel>(() => AddMenuModel());
  locator.registerFactory<WishModel>(() => WishModel());
}

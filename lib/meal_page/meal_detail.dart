import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:zesty/conf/config.inc.dart';
import 'package:zesty/meal_page/meal_order.dart';
import 'package:zesty/model/meal_detail.dart';
import 'package:zesty/scoped_model/meal_detail_model.dart';
import 'package:zesty/service_locator.dart';

class MealDetailPage extends StatefulWidget {
  final int mealID;
  const MealDetailPage({Key key, @required this.mealID}) : super(key: key);

  @override
  _MealDetailPageState createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  Conf config = new Conf();
  MealDetailModel mealDetailModel;
  int mealIndex = 0;
  int _currentImageIndex = 0;
  // List<MenuDetails> test = [
  //   MenuDetails(description: "lol", path: "app/image/1.jpg"),
  //   MenuDetails(description: "lol1", path: "app/image/1.jpg"),
  //   MenuDetails(description: "lol2", path: "app/image/1.jpg"),
  //   MenuDetails(description: "lol3", path: "app/image/1.jpg"),
  //   MenuDetails(description: "lol4", path: "app/image/1.jpg"),
  //   MenuDetails(description: "lol5", path: "app/image/1.jpg"),
  // ];
  String reason = '';
  void _updateImageIndex(int index, CarouselPageChangedReason changeReason) {
    setState(() {
      reason = changeReason.toString();
      _currentImageIndex = index;
      print(_currentImageIndex);
    });
  }

  @override
  void initState() {
    super.initState();
    mealDetailModel = locator<MealDetailModel>();
    mealDetailModel.fetchMealDetails(widget.mealID);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MealDetailModel>(
      model: mealDetailModel,
      child: ScopedModelDescendant<MealDetailModel>(
        builder: (BuildContext context, Widget child, MealDetailModel model) {
          Widget content = Text('No meals');
          if (model.isLoading) {
            content = Center(
              child: CircularProgressIndicator(),
            );
          } else if (!model.isLoading && model.meals.length > 0) {
            content = _buildPage(model);
          } else if (!model.isLoading && model.meals.length == 0) {}
          return content;
        },
      ),
    );
  }

  Widget _buildPage(MealDetailModel model) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Hexcolor('#F1F1F1'),
        iconTheme: IconThemeData(
          color: Hexcolor('#898888'),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  print('object');
                },
                child: Icon(
                  Icons.mail,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 20,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: CircleAvatar(
                      radius: 38,
                      backgroundImage: NetworkImage(
                          config.imagePath + model.meals[0].chefImage),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      model.meals[0].chefName,
                      style: TextStyle(
                        color: Hexcolor('#757373'),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 80,
            child: _buildCarousel(model.meals[0].menuDetails),
          ),
          Expanded(
            flex: 2,
            child: _buildDotIndicator(model.meals[0].menuDetails),
          ),
          Expanded(
            flex: 10,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: RaisedButton(
                      child: Text('立即預約'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => mealOrder(
                              mealDetail: model.meals,
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.mail,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
                Spacer(),
                Icon(Icons.hourglass_empty),
              ],
            ),
          ),
          Expanded(
            flex: 64,
            child: Container(
              child: Text(
                  model.meals[0].menuDetails[_currentImageIndex].description),
              padding: EdgeInsets.all(15),
            ),
          ),
        ],
      ),
    );
  }

//生成圖片輪播器
  Widget _buildCarousel(List<MenuDetails> menuDetails) {
    return Container(
      child: GestureDetector(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CarouselSlider(
              items: menuDetails.map((obj) {
                return Image.network(
                  config.imagePath + obj.path,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                );
              }).toList(),
              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                onPageChanged: _updateImageIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }

//生成圖片輪播器下面的點點
  Widget _buildDotIndicator(List<MenuDetails> menuDetails) {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: menuDetails.map((obj) {
            int index = menuDetails.indexOf(obj);
            print(index);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                ),
                color: _currentImageIndex == index
                    ? Hexcolor('#707070')
                    : Hexcolor('#FFFFFF'),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

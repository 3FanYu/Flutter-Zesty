import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:zesty/conf/config.inc.dart';
import 'package:zesty/model/meal_detail.dart';
import 'package:zesty/model/meal_send_order.dart';
import 'package:zesty/scoped_model/meal_send_order_model.dart';
import 'package:zesty/widgets/star_rating.dart';

import '../service_locator.dart';

class mealOrder extends StatefulWidget {
  final List<MealDetail> mealDetail;
  mealOrder({Key key, @required this.mealDetail}) : super(key: key);
  @override
  _mealOrderState createState() => _mealOrderState();
}

class _mealOrderState extends State<mealOrder> {
  Conf config = new Conf();
  SendOrderModel sendOrderModel;
  bool isLoading = false;
  TextEditingController _dateEditingController = TextEditingController();
  TextEditingController _timeEditingController = TextEditingController();
  TextEditingController _addressEditingController = TextEditingController();
  TextEditingController _setsEditingController = TextEditingController();
  TextEditingController _psEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    sendOrderModel = locator<SendOrderModel>();
    // sendOrderModel.fetchMealDetails(widget.mealID);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<SendOrderModel>(
      model: sendOrderModel,
      child: ScopedModelDescendant<SendOrderModel>(
          builder: (BuildContext context, Widget child, SendOrderModel model) {
        return Scaffold(
          backgroundColor: Hexcolor('#F1F1F1'),
          appBar: AppBar(
            backgroundColor: Hexcolor('#F1F1F1'),
            iconTheme: IconThemeData(
              color: Hexcolor('#898888'),
            ),
          ),
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 40,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          width: 180,
                          height: 180,
                          child: Image.network(
                            config.imagePath +
                                widget.mealDetail[0].menuDetails[0].path,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Spacer(),
                        Align(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.mealDetail[0].mealName,
                                style: TextStyle(
                                  fontSize: 28,
                                ),
                              ),
                              Text(
                                '用戶名稱',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Hexcolor('#727272'),
                                ),
                              ),
                              StarRating(
                                rating: 4,
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            '日期',
                            style: TextStyle(
                              fontSize: 25,
                              color: Hexcolor('#575757'),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          width: 200,
                          child: TextField(
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(),
                              controller: _dateEditingController,
                              style: TextStyle(
                                fontSize: 18,
                                height: 1.0,
                                color: Colors.black,
                              ),
                              onTap: () {
                                _datePicker(context);
                              }),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            '時間',
                            style: TextStyle(
                              fontSize: 25,
                              color: Hexcolor('#575757'),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          width: 200,
                          child: TextField(
                              decoration: InputDecoration(),
                              textAlign: TextAlign.end,
                              controller: _timeEditingController,
                              style: TextStyle(
                                fontSize: 18,
                                height: 1.0,
                                color: Colors.black,
                              ),
                              onTap: () {
                                _timePicker(context);
                              }),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            '地址',
                            style: TextStyle(
                              fontSize: 25,
                              color: Hexcolor('#575757'),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(),
                            controller: _addressEditingController,
                            style: TextStyle(
                              fontSize: 18,
                              height: 1.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            '單價',
                            style: TextStyle(
                              fontSize: 25,
                              color: Hexcolor('#575757'),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text(
                            "\$" + widget.mealDetail[0].price.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            '份數',
                            style: TextStyle(
                              fontSize: 25,
                              color: Hexcolor('#575757'),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(),
                            controller: _setsEditingController,
                            style: TextStyle(
                              fontSize: 18,
                              height: 1.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.purple),
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.teal),
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            '備註',
                            style: TextStyle(
                              fontSize: 25,
                              color: Hexcolor('#575757'),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(),
                            controller: _psEditingController,
                            style: TextStyle(
                              fontSize: 18,
                              height: 1.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ButtonTheme(
                            child: RaisedButton(
                              child: Text('確認下單'),
                              onPressed: () {
                                SendOrder data = SendOrder(
                                  id: widget.mealDetail[0].id,
                                  dateTime: _dateEditingController.text +
                                      " " +
                                      _timeEditingController.text,
                                  address: _addressEditingController.text,
                                  count: _setsEditingController.text == ''
                                      ? 0
                                      : int.parse(_setsEditingController.text),
                                  postScript: _psEditingController.text,
                                );
                                model.sendOrder(data);
                                setState(() {
                                  isLoading = true;
                                });
                              },
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              model.isLoading
                  ? Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container()
            ],
          ),
        );
      }),
    );
  }

  _datePicker(BuildContext context) async {
    final DateTime result = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100, 12));
    if (result != null) {
      _dateEditingController
        ..text = DateFormat('yyyy/MM/dd').format(result)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _dateEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  _timePicker(BuildContext context) async {
    final TimeOfDay result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (result != null) {
      _timeEditingController
        ..text = _addLeadingZeroIfNeeded(result.hour) +
            ":" +
            _addLeadingZeroIfNeeded(result.minute)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _timeEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  String _addLeadingZeroIfNeeded(int value) {
    if (value < 10) return '0$value';
    return value.toString();
  }
}

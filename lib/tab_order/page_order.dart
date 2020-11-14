import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<OrderPage>
    with AutomaticKeepAliveClientMixin<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: '待確認',
                ),
                Tab(text: '即將到來'),
                Tab(text: '已完成'),
              ],
            ),
            title: Text('訂單查詢'),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.local_laundry_service),
              Icon(Icons.ac_unit),
              Icon(Icons.do_not_disturb),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

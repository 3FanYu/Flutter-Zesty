import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:zesty/tab_wish/top_bar.dart';
import 'package:zesty/wishupload_menu/wishadd_menu.dart';
import 'body.dart';

mixin NamedRoute implements Widget {
  String get routeName;
}

class WishPage extends StatefulWidget with NamedRoute {
  WishPage({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();

  @override
  // TODO: implement routeName
  String get routeName => '/';
}

class _NavBarState extends State<WishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#FFF0F5'),
      appBar: TopBar(
        title: "許願池",
        backgroundColor: Hexcolor('#FFB6C1'),
        fontSize: 20.0,
        textColor: Hexcolor('#000000'),
      ),
      body: WishHomeBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[300],
        child: Text("我要\n許願"),
        onPressed: () {
          loadAssets();
        },
      ),
    );
  }
  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        // selectedAssets: images,
        //ios customization
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "chat",
        ),
        //Android customization
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Select Photos",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //沒選擇圖片就不跳頁、反之則跳。
    if (!mounted) return;
    if (resultList.length > 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddMenu(
            images: resultList,
          ),
        ),
      );
    }
  }
}

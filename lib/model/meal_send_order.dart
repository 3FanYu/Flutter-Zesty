class SendOrder {
  final int id;
  final String dateTime;
  final String address;
  final int count;
  final String postScript;
  final int userDetailId;

  SendOrder({
    this.id,
    this.dateTime,
    this.address,
    this.count,
    this.postScript,
    this.userDetailId,
  });
  Map toJson() => {
        'datetime': dateTime,
        'address': address,
        'count': count,
        'postscript': postScript,
        'menu_id': id,
        'user_detail_id': userDetailId,
      };
}

class SendOrderCallBack {
  final String message;

  SendOrderCallBack(this.message);
}

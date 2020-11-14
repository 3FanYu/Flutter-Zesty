class SendOrder {
  final int id;
  final String dateTime;
  final String address;
  final int count;
  final String postScript;

  SendOrder({
    this.id,
    this.dateTime,
    this.address,
    this.count,
    this.postScript,
  });
  Map toJson() => {
        'datetime': dateTime,
        'address': address,
        'count': count,
        'postscript': postScript,
        'menu_id': id,
      };
}

class SendOrderCallBack {
  final String message;

  SendOrderCallBack(this.message);
}

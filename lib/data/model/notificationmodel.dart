class NotificationModel {
  String? notificationId;
  String? notificationTitle;
  String? notificationBody;
  String? notificationUserid;
  String? notificationSerid;
  String? notificationSername;
  String? notificationRead;
  String? notificationDatetime;

  NotificationModel(
      {this.notificationId,
      this.notificationTitle,
      this.notificationBody,
      this.notificationUserid,
      this.notificationSerid,
      this.notificationSername,
      this.notificationRead,
      this.notificationDatetime});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationTitle = json['notification_title'];
    notificationBody = json['notification_body'];
    notificationUserid = json['notification_userid'];
    notificationSerid = json['notification_serid'];
    notificationSername = json['notification_sername'];
    notificationRead = json['notification_read'];
    notificationDatetime = json['notification_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_id'] = this.notificationId;
    data['notification_title'] = this.notificationTitle;
    data['notification_body'] = this.notificationBody;
    data['notification_userid'] = this.notificationUserid;
    data['notification_serid'] = this.notificationSerid;
    data['notification_sername'] = this.notificationSername;
    data['notification_read'] = this.notificationRead;
    data['notification_datetime'] = this.notificationDatetime;
    return data;
  }
}

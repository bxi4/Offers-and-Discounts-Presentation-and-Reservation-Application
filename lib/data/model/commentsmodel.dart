class CommentsModel {
  String? comId;
  String? comment;
  String? commentSername;
  String? commentUsers;
  String? commentServicesid;
  String? commentCategoriesid;
  String? commentProductid;

  CommentsModel(
      {this.comId,
      this.comment,
      this.commentSername,
      this.commentUsers,
      this.commentServicesid,
      this.commentCategoriesid,
      this.commentProductid});

  CommentsModel.fromJson(Map<String, dynamic> json) {
    comId = json['com_id'];
    comment = json['comment'];
    commentSername = json['comment_username'];
    commentUsers = json['comment_users'];
    commentServicesid = json['comment_servicesid'];
    commentCategoriesid = json['comment_categoriesid'];
    commentProductid = json['comment_productid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['com_id'] = this.comId;
    data['comment'] = this.comment;
    data['comment_username'] = this.commentSername;
    data['comment_users'] = this.commentUsers;
    data['comment_servicesid'] = this.commentServicesid;
    data['comment_categoriesid'] = this.commentCategoriesid;
    data['comment_productid'] = this.commentProductid;
    return data;
  }
}

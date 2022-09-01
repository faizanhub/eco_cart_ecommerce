class AllCategoriesResponse {
  String? message;
  int? statusCode;
  List<CategoriesData>? data;

  AllCategoriesResponse({this.message, this.statusCode, this.data});

  AllCategoriesResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      data = <CategoriesData>[];
      json['data'].forEach((v) {
        data!.add(CategoriesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['statusCode'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoriesData {
  int? id;
  String? title;
  String? icon;
  String? color;

  CategoriesData({this.id, this.title, this.icon, this.color});

  CategoriesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    icon = json['icon'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['icon'] = icon;
    data['color'] = color;
    return data;
  }
}

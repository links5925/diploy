import 'dart:io';

class Portfolio {
  DateTime dateTime;
  String? id;
  String? name;
  String? url;
  String? q1;
  String? q2;
  String? q3;
  int? category;
  Portfolio(this.dateTime, this.id, this.name, this.q1, this.q2, this.q3,
      this.url, this.category);
}

class PostPortfolio {
  String? id;
  String? name;
  File? image;
  String? q1;
  String? q2;
  String? q3;
  int? category;
  PostPortfolio(
      this.id, this.name, this.q1, this.q2, this.q3, this.image, this.category);
}

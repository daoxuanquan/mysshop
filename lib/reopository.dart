import 'package:dio/dio.dart';

class AppRepository {
  late Dio _dio;
  String baseUrl = "";
  AppRepository({Dio? dio}) {
    this._dio = dio ?? Dio();
  }
  Future<List<Item>> initRequet() async {
    List<Item> items = [];

    Response response =
        await _dio.get('https://jsonplaceholder.typicode.com/posts');
    List<dynamic> list = response.data;
    for (var item in list) {
      items.add(Item.fromJson(item));
    }
    return items;
  }
}

class Item {
  int userId = 0;
  int id = 0;
  String title = '';
  String body = '';

  Item.fromJson(Map map) {
    this.userId = map['userId'];
    this.id = map['id'];
    this.body = map['body'];
    this.title = map['title'];
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_lists/data/models/model_reqres.dart';

abstract class ReqresRepo {
  Future getData();
  Future<List<Data>> getListofdata();
}

class ReqresRepoImpl implements ReqresRepo {
  @override
  Future<List<Data>> getListofdata() async{
    /// CONVERT JSON RESPONSE INTO A LIST OF DATA
    final respon = await http.get(
        Uri.parse("https://reqres.in/api/users?page=2")
    );
    if (respon.statusCode == 200) {
      final decodedRespon = json.decode(respon.body);
      Model model = Model.fromJson(decodedRespon);
      List<Data> dataList = model.data;
      return dataList;
    } else {
      throw Exception('Exception');
    }
  }

  @override
  Future getData() async {
    final respon = await http.get(
        Uri.parse("https://reqres.in/api/users?page=2")
    );
    if (respon.statusCode == 200) {
      final decodedRespon = json.decode(respon.body);
      Model model = Model.fromJson(decodedRespon);
      Data data;
      for (var d in model.data) {
        data = d;
      }
      return data;
    } else {
      throw Exception('Exception');
    }
  }

}
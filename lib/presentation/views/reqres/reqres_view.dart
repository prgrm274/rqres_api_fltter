import 'dart:convert';
import 'package:flutter_lists/data/models/model_reqres.dart';
import 'package:http/http.dart' as httpnya;
import 'package:flutter/material.dart';

/// TO SHOW "DATA" PROPERTY ONLY
class ReqresView extends StatefulWidget {

  @override
  Statenya createState() => Statenya();
}

class Statenya extends State<ReqresView> {

  List<Data> parseData(String responseBody){
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Data>((json) => Data.fromJson(json)).toList();
  }
  ///↓
  Future<List<Data>> fetchData(httpnya.Client klien) async {
    final respon = await klien.get(Uri.parse("https://reqres.in/api/users?page=2"));
    return parseData(respon.body);
  }
  
  int id;
  String fn, ln, a, e;
  Model model;
  Future _loadReqres() async {
    httpnya.Client klien = new httpnya.Client();
    final jsonString = await klien.get(
       Uri.parse("https://reqres.in/api/users?page=2")
    );
    final jsonResponse = json.decode(jsonString.body);
    model = new Model.fromJson(jsonResponse);
    print('model = $model');
    print('model.data.length = ${model.data.length}');
    for (var i=0; i<model.perPage; i++){
      print('email=> ${model.data[i].email}');
    }
    setState(() {
      for (var i=0; i<model.perPage; i++){
        id = model.data[i].id;
        fn = model.data[i].firstName;
        ln = model.data[i].lastName;
        e = model.data[i].email;
        a = model.data[i].avatar;
        print('ln=> ${model.data[i].lastName}');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this._loadReqres();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Center(
          child: new ListView.builder(
            itemCount: model.perPage,
            itemBuilder: (context, int indeks){
              return new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  new Text('${model.data[indeks].id}'),
                  new Text('${model.data[indeks].firstName}'),
                  new Text('${model.data[indeks].lastName}'),
                  new Text('${model.data[indeks].avatar}'),
                  new Text('${model.data[indeks].email}'),
                  new Divider(),
                ],
              );
            },
          )
        ),
      ),
    );
  }
}

class ReqresList extends StatelessWidget {
  final List<Data> dataList;

  ReqresList({Key key, this.dataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, int indeks){
        return new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            new Text('${dataList[indeks].id}'),
            new Text('${dataList[indeks].avatar}'),
            new Text('${dataList[indeks].email}'),
            new Text('${dataList[indeks].firstName}'),
            new Text('${dataList[indeks].lastName}'),
            new Text('$dataList'),
            new Divider(),
          ],
        );
      },
    );
  }
}

class ReqresListManual extends StatelessWidget {
  String id, fn, ln, a, e;

  ReqresListManual({this.id, this.fn, this.ln, this.a, this.e});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: 5,
      itemBuilder: (context, int indeks){
        return new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            new Text('$id'),
            new Text('$fn'),
            new Text('$ln'),
            new Text('$a'),
            new Text('$e'),
            new Divider(),
          ],
        );
      },
    );
  }
}
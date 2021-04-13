import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lists/bloc/reqres/exports.dart';
import 'package:flutter/material.dart';

/// FOR List of Data USING BLOC
class ReqresViewwithbloclist extends StatefulWidget {

  @override
  Statenya createState() => Statenya();
}

class Statenya extends State<ReqresViewwithbloclist> {
  ReqresBLOC reqresBLOC;

  @override
  void initState() {
    super.initState();
    reqresBLOC = BlocProvider.of<ReqresBLOC>(context);
    reqresBLOC.add(FetchEvent());
  }

  Widget widgetLoadng(){
    return Center(
      child: CircularProgressIndicator(backgroundColor: Colors.yellowAccent,),
    );
  }

  Widget widgetErr(String msg){
    return Center(
      child: Text(msg),
    );
  }

  Widget widgetList(statenya){
    return ListView.builder(
      itemCount: statenya.dataList.length,
      itemBuilder: (context, indeks){
        return new Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
          ),
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              new Text(
                  '${statenya.dataList[indeks].id} - ${statenya.dataList[indeks].firstName} ${statenya.dataList[indeks].lastName}'
              ),
              new Text(
                  '${statenya.dataList[indeks].email}',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold
                ),
              ),
              new Image.network(
                statenya.dataList[indeks].avatar,
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              body: BlocListener<ReqresBLOC, ReqresState>(
                listener: (context, statenya) {
                  if (statenya is ErrState) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text(statenya.message))
                    );
                  }
                },
                child: BlocBuilder<ReqresBLOC, ReqresState>(
                  builder: (context, statenya) {
                    if (statenya is InitialState) {
                      return widgetLoadng();

                    } else if (statenya is LoadngState) {
                      return widgetLoadng();

                    } else if (statenya is LoaddState) {
                      return widgetList(statenya);

                    } else if (statenya is ErrState) {
                      return widgetErr('Error state=> ${statenya.message}');

                    }
                    return null;
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
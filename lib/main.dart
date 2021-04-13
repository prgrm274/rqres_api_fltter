import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lists/bloc/reqres/exports.dart';
import 'package:flutter_lists/presentation/views/reqres/reqres_view_with_bloc_list.dart';
import 'package:flutter_lists/repos/reqres/reqres_repo.dart';
import 'package:toast/toast.dart';

void main(){
  runApp(Statefulnya());
}

class Statefulnya extends StatefulWidget {
  Statefulnya({Key key}) : super(key: key);
  _StatenyaStateful createState() => _StatenyaStateful();
}

class _StatenyaStateful extends State<Statefulnya>{

  @override
  Widget build(BuildContext context) {

    return BlocProvider<ReqresBLOC>(
      create: (context) => ReqresBLOC(repo: ReqresRepoImpl()),
      child: MaterialApp(
        /// BLOC OF LIST
        home: ReqresViewwithbloclist(),
      ),
    );
  }

}
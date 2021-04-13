import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lists/bloc/reqres/exports.dart';
import 'package:flutter_lists/data/models/model_reqres.dart';
import 'package:flutter_lists/repos/reqres/reqres_repo.dart';

class ReqresBLOC extends Bloc<ReqresEvent, ReqresState> {
  ReqresRepo repo;
  ReqresBLOC({@required this.repo});

  @override
  ReqresState get initialState => InitialState();

  @override
  Stream<ReqresState> mapEventToState(ReqresEvent event) async* {
    if (event is FetchEvent) {
      yield LoadngState();
      try {
        /// LIST<DATA>
        List<Data> dataList = await repo.getListofdata();
        yield LoaddState(dataList: dataList);
      } catch (catched) {
        yield ErrState(message: catched.toString());
      }
    }
  }

}
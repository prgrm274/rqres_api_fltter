
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lists/data/models/model_reqres.dart';

abstract class ReqresState extends Equatable {

}

class InitialState extends ReqresState {
  List<Object> get props => [];
}

class LoadngState extends ReqresState {
//  @override
  List<Object> get props => [];
}

class LoaddState extends ReqresState {
  List<Object> get props => [dataList];
  List<Data> dataList;
  LoaddState({@required this.dataList});

}

class ErrState extends ReqresState {
  List<Object> get props => [message];
  String message;
  ErrState({@required this.message});
}


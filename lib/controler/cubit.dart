
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled13/controler/states.dart';

import '../modles/newsModel.dart';
import '../modles/tableModel.dart';
import '../modules/FootbalTable.dart';
import '../modules/matchesResult.dart';
import '../modules/newsScreen.dart';
import 'dioHelper.dart';

class FootballCubit extends Cubit<FootballStates>{
  FootballCubit():super(InitSates());
  static FootballCubit getCubit(context)=>BlocProvider.of(context);
 var matchesResult;
 List <TableModel> tableModel=[];
  List<NewsModel> newsModel=[];
  late List<String> matchDays=[];
  late String dropdownValue;
  bool isButtonDisabled = true;


  Future getMatchesRuslt(quary)async{
    emit(LodingSates());
     await DioHelper.getData('$quary').then(( value){
       matchDays=[];
       matchesResult=null;
       matchesResult=value.data[0];
       value.data[0].keys.forEach((element){
         matchDays.add(element);
       });
        dropdownValue= matchDays[0];
        emit(SuccessSates());
       print(matchDays);
       print(matchDays[1]);
       print(matchesResult['${matchDays[1]}'].length);
     });
  }
  Future getFootbalNews(quary)async{
    emit(LodingSates());
     await DioHelper.getData('$quary').then(( value){
          value.data.forEach((element) {
            newsModel.add(NewsModel.fromJson(element));
          });
       emit(SuccessSates());
     });
  }
  Future getRankingTable(quary)async{
    emit(LodingSates());
     await DioHelper.getData('$quary').then(( value){
          tableModel=[];
          value.data.forEach((element) {
            tableModel.add(TableModel.fromJson(element));
          });
       emit(SuccessSates());
     });
  }

  List<Widget> screen(cubit)=>[
  MatchesResult(cubit),
  StandingsTable(),
  NewsScreen(),
];


  void onchange(value){
    dropdownValue=value;
    emit(SuccessSates());
  }

  int currentIndex=0;
  onChangeNavBar(index){
    currentIndex=index;
    emit(SuccessSates());
  }

  void refrchData(league) async{
    isButtonDisabled=false;
    print(isButtonDisabled);
    emit(LodingSates());
    newsModel=[];
    tableModel=[];
    matchesResult=null;
    await getFootbalNews('$league/news');
    await getMatchesRuslt('$league/results');
    await getRankingTable('$league/table');
    isButtonDisabled=true;
emit(SuccessSates());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled13/controler/cubit.dart';
import 'controler/dioHelper.dart';
import 'modules/homeFootball.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  FlutterNativeSplash.removeAfter(init);
  runApp(const MyApp());
}
Future init(BuildContext context)async{

  await Future.delayed(Duration(seconds: 3));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String League='premierleague';
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context)=>FootballCubit()..getFootbalNews('$League/news')
            ..getMatchesRuslt('$League/results')..getRankingTable('$League/table'),)
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:HomeFootball(),
      ),
    );
  }
}

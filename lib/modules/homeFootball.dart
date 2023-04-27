
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controler/cubit.dart';
import '../controler/states.dart';
class HomeFootball extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return BlocConsumer<FootballCubit,FootballStates>(
      builder: (context,state){
        FootballCubit cubit=FootballCubit.getCubit(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green.shade400,),
            drawer: Drawer(
              width: 250,
              child: ListView(
                // Important: Remove any padding from the ListView.
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                      size: 40,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(

                    leading: Image.asset('assets/primerL.jpg',width: 60,),
                    title: const Text('Premier League(England)',style: TextStyle(fontSize: 13),),
                    onTap:cubit.isButtonDisabled ?() {
                      cubit.refrchData('premierleague');
                    }:null,
                  ),
                  ListTile(

                    leading: Image.asset('assets/laligue.png',width: 60,),
                    title: const Text('La Liga (Spain)',style: TextStyle(fontSize: 13),),
                    onTap:cubit.isButtonDisabled ? () {
                      cubit.refrchData('laliga');
                    }:null,
                  ),
                  ListTile(
                    leading: Image.asset('assets/serie.jpg'),
                    title: const Text('Serie A (Italy)',style: TextStyle(fontSize: 13),),
                    onTap:cubit.isButtonDisabled ? () {
                      cubit.refrchData('seriea');
                    }:null,
                  ),
                  ListTile(
                    leading:Image.asset('assets/bound.png',width: 50,),
                    title: const Text('Bundesliga (Germany)',style: TextStyle(fontSize: 13),),
                    onTap: cubit.isButtonDisabled ?() {
                     cubit.refrchData('bundesliga');
                    }:null,
                  ),
                  ListTile( leading: Image.asset('assets/ligue1.png'),

                    title: const Text('Ligue 1 (France)',style: TextStyle(fontSize: 13),),
                    onTap:cubit.isButtonDisabled ? () {
                      cubit.refrchData('ligue1');
                    }:null,
                  ),
                  ListTile( leading: Image.asset('assets/egleague.png',width: 48,),
                    title: const Text('Egyptian Premier League',style: TextStyle(fontSize: 13),),
                    onTap: cubit.isButtonDisabled ? () {
                      cubit.refrchData('egyptianpremierleague');
                    }:null,
                  ),
                ],
              ),
        ),
            bottomNavigationBar:BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap:(index){cubit.onChangeNavBar(index);},
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.sports_baseball_rounded),label: 'Result'),
                BottomNavigationBarItem(icon: Icon(Icons.table_chart_rounded,),label: 'Table'),
                BottomNavigationBarItem(icon: Icon(Icons.newspaper),label: 'News'),

              ],
            ) ,
          body:cubit.matchesResult==null?Center(child: CircularProgressIndicator(),):cubit.screen(cubit)[cubit.currentIndex],
        );
      },
      listener: (context,state){
        if(state is SuccessSates){
        }
      },
      //622c623a-ee5e-4690-9b66-c70cb6a805b9
    );
  }
}

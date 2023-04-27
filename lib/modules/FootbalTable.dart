
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled13/controler/cubit.dart';

import '../controler/states.dart';

class StandingsTable extends StatefulWidget {
  const StandingsTable({Key? key}) : super(key: key);

  @override
  _StandingsTableState createState() => _StandingsTableState();
}

class _StandingsTableState extends State<StandingsTable> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FootballCubit,FootballStates>(
      builder: (context,state){
        FootballCubit cubit=FootballCubit.getCubit(context);
        return state is LodingSates ?Center(child: CircularProgressIndicator(),):
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowHeight: 60,
              border: TableBorder.all(
                color: Colors.grey,
                width: 1,
              ),
              columns: const <DataColumn>[
                DataColumn(label: Text('Club')),
                DataColumn(label: Text('Pts')),
                DataColumn(label: Text('MP')),
                DataColumn(label: Text('W')),
                DataColumn(label: Text('L')),
                DataColumn(label: Text('D')),
                DataColumn(label: Text('GD')),
              ],
              rows: List<DataRow>.generate(
                cubit.tableModel.length,
                    (index) => DataRow(
                  cells: <DataCell>[
                    DataCell(Row(
                      children: [
                        Text('${cubit.tableModel[index].position}'),
                        Image.network('${cubit.tableModel[index].squadLogo}',width: 50,height: 50,),
                        SizedBox(width: 100,child: Text('${cubit.tableModel[index].name}',maxLines: 1,overflow: TextOverflow.ellipsis,)),
                      ],
                    )),
                    DataCell(Text('${cubit.tableModel[index].points}')),
                    DataCell(Text('${cubit.tableModel[index].played}')),
                    DataCell(Text('${cubit.tableModel[index].winned}')),
                    DataCell(Text('${cubit.tableModel[index].loosed}')),
                    DataCell(Text('${cubit.tableModel[index].tie}')),
                    DataCell(Text('${cubit.tableModel[index].goalDifference}')),
                  ],
                ),
              ),
            ),
          ),
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

class Team {
  String name;
  int wins;
  int draws;
  int losses;
  int goalsFor;
  int goalsAgainst;

  Team({required this.name, required this.wins, required this.draws, required this.losses, required this.goalsFor, required this.goalsAgainst});

  int get points {
    return (wins * 3) + draws;
  }

  int get matchesPlayed {
    return wins + draws + losses;
  }

  int get goalDifference {
    return goalsFor - goalsAgainst;
  }
}
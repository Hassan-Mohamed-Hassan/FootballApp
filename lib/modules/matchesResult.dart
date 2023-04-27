
import 'package:flutter/material.dart';
import 'package:untitled13/controler/cubit.dart';

class MatchesResult extends StatelessWidget {
 FootballCubit cubit;

 MatchesResult(this.cubit);

  @override
  Widget build(BuildContext context) {
    print(cubit.matchDays);
    return
    SingleChildScrollView(
      child: Column(
        children: [
        if(cubit.matchDays.length!=0&&cubit.dropdownValue!=null)  Container(
            padding: EdgeInsets.all(10),
            child: DropdownButton<String>(
              value:cubit.dropdownValue,
              isExpanded: true,
              itemHeight: 80,
              iconSize: 50,
              underline: Container(color: Colors.blue,height:2,width: 100,),
              borderRadius: BorderRadius.circular(20),
              onChanged: (newValue) {
                cubit.onchange(newValue);
              },
              items:cubit.matchDays.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListView.separated
            (
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index)=> Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network('${cubit.matchesResult[cubit.dropdownValue][index]['homeLogo']}',),
                        SizedBox(height: 10,),
                        Text('${cubit.matchesResult[cubit.dropdownValue][index]['homeTeam']}',style: TextStyle(fontSize: 20)),
                      ],
                    )),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(child: Text('${cubit.matchesResult[cubit.dropdownValue][index]['homeTeamScore']}',style: TextStyle(fontSize: 30),)),
                            Expanded(child: Text(':',style: TextStyle(fontSize: 30),)),
                            Expanded(child: Text('${cubit.matchesResult[cubit.dropdownValue][index]['awayTeamScore']}',style: TextStyle(fontSize: 30),)),
                          ],
                        ),
                      ),
                    )),
                    Expanded(child: Column(
                      children: [
                        Image.network('${cubit.matchesResult[cubit.dropdownValue][index]['awayLogo']}',),
                        SizedBox(height: 10,),
                        Text('${cubit.matchesResult[cubit.dropdownValue][index]['awayTeam']}',style: TextStyle(fontSize: 20)),
                      ],
                    )),
                  ],
                ),
              ),
              separatorBuilder: (context,index)=>Container(color: Colors.blue,width: double.infinity,height: 2,),
              itemCount: cubit.matchesResult[cubit.matchDays[1]].length),
        ],
      ),
    );
  }
}

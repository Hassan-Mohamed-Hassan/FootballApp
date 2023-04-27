
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled13/controler/cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controler/states.dart';
class NewsScreen extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return BlocConsumer<FootballCubit,FootballStates>(
      builder:(context,state){
        FootballCubit cubit=FootballCubit.getCubit(context);
        return cubit.newsModel.length==0?Container(
            child:Center(
                child: Text('Not Exist News', style: TextStyle(fontSize: 20,color: Colors.blue),)))

            :Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.separated(
              itemBuilder: (context,index){
                return InkWell(
                  onTap: ()async{
                  String uri='${cubit.newsModel[index].newsLink}';
                    final uriParsed = Uri.parse(uri);
                    if (await canLaunchUrl(uriParsed)) {
                      await launchUrl(uriParsed);
                    } else {
                      throw 'Could not launch $uri';
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network('${cubit.newsModel[index].publisherLogo}',),
                          Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${cubit.newsModel[index].publisherName}',style: TextStyle(fontSize: 16,color: Colors.blue),),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text('${cubit.newsModel[index].publisherDate}',style: TextStyle(fontSize: 13,color: Colors.grey),),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height:10),
                      Image.network('${cubit.newsModel[index].image}',
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: 10,),
                      Text('${cubit.newsModel[index].title}',style: TextStyle(fontSize: 18),),


                    ],
                  ),
                );
              },
              separatorBuilder: (context,index)=>SizedBox(height: 10,),
              itemCount: cubit.newsModel.length),
        );
      },
      listener: (context,state){},
    );
  }
}

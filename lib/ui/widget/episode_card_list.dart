import 'package:flutter/material.dart';
import 'package:testeaz/domain/episode_model.dart';

class EpisodeCardList extends StatefulWidget {
  const EpisodeCardList({super.key, required this.list});

  final List<EpisodeModel> list;

  @override
  State<EpisodeCardList> createState() => _EpisodeCardListState();
}

class _EpisodeCardListState extends State<EpisodeCardList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 11,
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, i){
        if(i == 10) {
          return IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.of(context).pushNamed('/episodes');
            },
          );
        } else {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.5)
            ),
            height: 200,
            width: 150,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Image.network('https://m.media-amazon.com/images/I/81EBYGGN6QL._AC_UF1000,1000_QL80_.jpg'),           
                Container(
                  height: 200,
                  width: 135,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.greenAccent.shade100,],
                      stops: [0.01, 0.99],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Nome do EP', style: TextStyle(fontSize: 15),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.group_sharp, size: 20,),
                              SizedBox(width: 5,),
                              Text('25', style: TextStyle(fontSize: 15)),
                            ],
                          ),
                          Text('Episodio: $i', style: TextStyle(fontSize: 15),),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 16,),
                          Text('18/03/2025', style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      }
    );
  }
}
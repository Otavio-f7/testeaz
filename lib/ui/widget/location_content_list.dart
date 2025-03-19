import 'package:flutter/material.dart';
import 'package:testeaz/domain/episode_model.dart';

class LocationContentList extends StatefulWidget {
  const LocationContentList({super.key, required this.list});

  final List<EpisodeModel> list;

  @override
  State<LocationContentList> createState() => _LocationContentListState();
}

class _LocationContentListState extends State<LocationContentList> {
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
            height: 200,
            width: 150,
            padding: EdgeInsets.symmetric(horizontal: 7.5),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image
                    .network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqzuLs6Ic7_VRSrtiEx9C4_x4QhIaOMMw81Q&s',
                    fit: BoxFit.fitWidth,
                  )
                ),           
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 200,
                    width: 135,
                    // padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.greenAccent.shade100,],
                        stops: [0.01, 0.85],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Terra', style: TextStyle(fontSize: 12),),
                        Text('Dimension C-$i', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                      ],
                    ),
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
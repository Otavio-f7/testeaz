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
      itemCount: widget.list.length + 1,
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, i){
        if(i == widget.list.length) {
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image
                    .network(
                    'https://m.media-amazon.com/images/I/81EBYGGN6QL._AC_UF1000,1000_QL80_.jpg'
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
                        Text(
                          widget.list[i].episode,
                          style: TextStyle(fontSize: 11),
                        ),
                        Text(
                          widget.list[i].name.length > 15
                          ? '${widget.list[i].name.substring(0, 15)}...'
                          : widget.list[i].name,
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                        ),
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
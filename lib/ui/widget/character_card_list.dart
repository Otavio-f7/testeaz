import 'package:flutter/material.dart';
import 'package:testeaz/domain/character_model.dart';

class CharacterCardList extends StatefulWidget {
  const CharacterCardList({super.key, required this.list});

  final List<CharacterModel> list;

  @override
  State<CharacterCardList> createState() => _CharacterCardListState();
}

class _CharacterCardListState extends State<CharacterCardList> {
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
              borderRadius: BorderRadius.circular(25)
            ),
            padding: EdgeInsets.all(7.5),
            height: 165,
            width: 150,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image
                    .network(
                    'https://rickandmortyapi.com/api/character/avatar/${i+1}.jpeg'
                  )
                ),           
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 150,
                    width: 135,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.greenAccent.shade100,],
                        stops: [0.01, 0.89],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Personagem', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
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
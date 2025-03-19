import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testeaz/ui/controller/episodes_controller.dart';
import 'package:testeaz/ui/widget/character_card_list.dart';
import 'package:testeaz/ui/widget/episode_card_list.dart';
import 'package:testeaz/ui/widget/location_content_list.dart';
import 'package:testeaz/ui/widget/section_title.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  final controller =  EpisodesController();
  
  @override
  void initState() {
    super.initState();
    controller.getEpisodes();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick And Morty'),
        centerTitle: true,
        titleTextStyle: GoogleFonts.bebasNeue(fontSize: 40, color: Theme.of(context).colorScheme.primary),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(text: 'Episodios'),
            FutureBuilder(
              future: controller.getEpisodes(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator());
                }
                if(snapshot.connectionState == ConnectionState.none){
                  return Center(
                    child: Text(controller.erro),
                  );
                }
                if(snapshot.connectionState == ConnectionState.done && controller.state.isEmpty){
                  return const Center(child: Text('Nenhum Item na Lista'),);
                } else{
                  return SizedBox(
                    height: 200,
                    child: EpisodeCardList(list: controller.state,),
                  );
                }
              }
            ),
            SectionTitle(text: 'Personagens'),
            SizedBox(
              height: 150,
              child: CharacterCardList(list: List.empty()),
            ),
            SectionTitle(text: 'Lugares'),
            SizedBox(
              height: 170,
              child: LocationContentList(list: List.empty()),
            ),
          ],
        ),
      ),
    );
  }
}
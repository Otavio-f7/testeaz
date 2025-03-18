import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testeaz/ui/controller/episodes_controller.dart';
import 'package:testeaz/ui/widget/episode_card_list.dart';
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
            SizedBox(
              height: 200,
              child: EpisodeCardList(list: List.empty(),),
            ),
            SectionTitle(text: 'Personagens'),
            SizedBox(
              height: 200,
              child: EpisodeCardList(list: List.empty()),
            ),
            SectionTitle(text: 'Lugares'),
            SizedBox(
              height: 200,
              child: EpisodeCardList(list: List.empty()),
            ),
          ],
        ),
      ),
    );
  }
}
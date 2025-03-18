import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testeaz/ui/controller/episodes_controller.dart';

class EpisodesPage extends StatefulWidget {
  const EpisodesPage({super.key});

  @override
  State<EpisodesPage> createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {

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
        title: const Text('Episodios'),
        centerTitle: true,
        titleTextStyle: GoogleFonts.bebasNeue(fontSize: 40, color: Theme.of(context).colorScheme.primary),
      ),
      body: AnimatedBuilder(
        animation: Listenable.merge([
          controller.isLoading,
          controller.erro,
          controller.state,
        ]),
        builder: (context, child) {
          
          if(controller.isLoading.value){
            return const Center(child: CircularProgressIndicator());
          }
          if(controller.erro.value.isNotEmpty){
            return Center(
              child: Text(controller.erro.value),
            );
          }
          if(controller.state.value.isEmpty){
            return const Center(child: Text('Nenhum Item na Lista'),);
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Pesquisar',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      prefixIcon: const Icon(Icons.search),
                      focusColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Expanded(
                  child: Text('a'),  
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
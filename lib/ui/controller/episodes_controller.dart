import 'package:flutter/material.dart';
import 'package:testeaz/data/service/episodes/episodes_service.dart';
import 'package:testeaz/data/service/exceptions.dart';
import 'package:testeaz/domain/episode_model.dart';

class EpisodesController extends ChangeNotifier{
  final service = EpisodesService();

  // Loading
  bool isLoading = false;

  // State 
  List<EpisodeModel> state = [];

  // Erro
  String erro = '';

  Future getEpisodes() async{
    isLoading = true;

    try{
      final result = await service.getEpisodes();
      state = result;
    } on NotFoundException catch (e){
      erro = e.message;
    } catch(e){
      erro = e.toString();
    }

    isLoading = false;
  }
}
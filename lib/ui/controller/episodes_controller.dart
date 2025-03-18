import 'package:flutter/material.dart';
import 'package:testeaz/data/service/episodes/episodes_service.dart';
import 'package:testeaz/data/service/exceptions.dart';
import 'package:testeaz/domain/episode_model.dart';

class EpisodesController {
  final service = EpisodesService();

  // Loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // State 

  final ValueNotifier<List<EpisodeModel>> state = 
    ValueNotifier<List<EpisodeModel>>([]);

  // Erro
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  Future getEpisodes() async{
    isLoading.value = true;

    try{
      final result = await service.getEpisodes();
      state.value = result;
    } on NotFoundException catch (e){
      erro.value = e.message;
    } catch(e){
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}
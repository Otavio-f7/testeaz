import 'package:testeaz/data/repositories/episode_repository.dart';
import 'package:testeaz/domain/episode_model.dart';

abstract class EpisodesService{
  Future<List<EpisodeModel>> getEpisodes();

  factory EpisodesService(){
    return EpisodeRepository();
  }
}
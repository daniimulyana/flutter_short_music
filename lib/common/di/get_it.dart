import 'package:flutter_short_music/data/api/music_api.dart';
import 'package:flutter_short_music/data/datasource/music_data_source.dart';
import 'package:flutter_short_music/data/repositories/music_data_repositories.dart';
import 'package:flutter_short_music/domain/repositories/music_repositories.dart';
import 'package:flutter_short_music/domain/usecases/get_music.dart';
import 'package:flutter_short_music/presentation/blocs/music_list/music_list_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:just_audio/just_audio.dart';

import '../../presentation/blocs/music_player/music_player_cubit.dart';

final getItInstance = GetIt.I;

Future<void> initiateGetIt() async {

  // Bloc Provider
  getItInstance.registerFactory(() => MusicPlayerCubit(audioPlayer: getItInstance()));

  getItInstance.registerFactory(() => MusicListCubit(getMusic: getItInstance()));

  // UseCase Provider
  getItInstance.registerLazySingleton<GetMusic>(
          () => GetMusic(repository: getItInstance())
  );

  // Repositories Provider
  getItInstance.registerLazySingleton<MusicRepository>(
          () => MusicDataRepositories(musicDataSource: getItInstance()),
  );

  // Data Resource Provider
  getItInstance.registerLazySingleton<MusicDataSource>(
          () => MusicDataSourceImpl(api: getItInstance())
  );

  // Api Provider
  getItInstance.registerLazySingleton(() => MusicApi(getItInstance()));

  getItInstance.registerLazySingleton(() => AudioPlayer());
  getItInstance.registerLazySingleton(() => Client());

}
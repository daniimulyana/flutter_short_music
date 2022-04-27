import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_short_music/common/enum/enums.dart';
import 'package:flutter_short_music/domain/entities/music.dart';

import '../../../domain/usecases/get_music.dart';

part 'music_list_state.dart';

class MusicListCubit extends Cubit<MusicListState> {
  final GetMusic getMusic;
  final String _defaultQuery = 'Featured';

  MusicListCubit({
    required this.getMusic,
  }) : super(const MusicListState()) {
    loadInitial();
  }

  loadInitial() {
    loadMusicByQuery(query: _defaultQuery);
  }

  loadMusicByQuery({required String query}) async {
    emit(state.copyWith(stateStatus: BlocState.isLoading));

    final musicData = await getMusic(
      GetMusicParams(searchQuery: query.isEmpty ? _defaultQuery : query),
    );

    musicData.fold(
            (failure) => emit(
              state.copyWith(
                errorMessage: failure.errorMessage,
                stateStatus: BlocState.isFailure
              )
            ), (music) => emit(
        state.copyWith(
          music: music,
          stateStatus: BlocState.isLoaded
        )
    ));

  }

  Music selectedMusic(int index) {
    emit(state.copyWith(currentIndex: index));
    return state.music[index];
  }
}
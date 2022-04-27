import 'package:equatable/equatable.dart';
import 'package:flutter_short_music/common/error/failures.dart';
import 'package:flutter_short_music/common/usecases/BaseUseCase.dart';
import 'package:flutter_short_music/domain/entities/music.dart';
import 'package:flutter_short_music/domain/repositories/music_repositories.dart';
import 'package:fpdart/fpdart.dart';

class GetMusic implements BaseUseCase<List<Music>?, GetMusicParams> {
  final MusicRepository repository;

  GetMusic({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Music>?>> call(GetMusicParams params) async {
    return await repository.getMusicBySearch(searchQuery: params.searchQuery);
  }
}

class GetMusicParams extends Equatable {
  final String searchQuery;

  const GetMusicParams({
    required this.searchQuery,
  });

  @override
  List<Object> get props => [searchQuery];

}
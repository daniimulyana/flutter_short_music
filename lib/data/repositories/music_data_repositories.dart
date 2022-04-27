import 'package:flutter_short_music/common/error/failures.dart';
import 'package:flutter_short_music/data/datasource/music_data_source.dart';
import 'package:flutter_short_music/domain/entities/music.dart';
import 'package:flutter_short_music/domain/repositories/music_repositories.dart';
import 'package:fpdart/fpdart.dart';

class MusicDataRepositories extends MusicRepository {
  final MusicDataSource musicDataSource;

  MusicDataRepositories({
    required this.musicDataSource
  });

  @override
  Future<Either<Failure, List<Music>?>> getMusicBySearch({required String searchQuery}) async {
    try {
      final response = await musicDataSource.getMusicBySearch(searchQuery: searchQuery);
      print(Right(response));
      return Right(response);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

}
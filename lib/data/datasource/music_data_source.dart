import 'package:flutter_short_music/data/api/music_api.dart';
import 'package:flutter_short_music/data/entities/music_list_response.dart';
import 'package:flutter_short_music/domain/entities/music.dart';

abstract class MusicDataSource {
  Future<List<Music>?> getMusicBySearch({required String searchQuery});
}

class MusicDataSourceImpl extends MusicDataSource {
  final MusicApi api;

  MusicDataSourceImpl({
    required this.api
  });

  @override
  Future<List<Music>?> getMusicBySearch({required String searchQuery}) async {
    final response = await api.get(searchQuery);

    return MusicListResponse.fromJson(response).music;
  }

}
import 'package:flutter_short_music/data/entities/music_reponse.dart';

class MusicListResponse {
  final int resultCount;
  final List<MusicResponse>? music;

  MusicListResponse({
    required this.resultCount,
    required this.music,
  });

  factory MusicListResponse.fromJson(Map<String, dynamic> json) {
    final resultCount = json['resultCount'];
    final List<MusicResponse> resultMusic = <MusicResponse>[];

    if (json['results'] != null) {
      json['results'].forEach((v) {
        resultMusic.add(MusicResponse.fromJson(v));
      });
    }

    return MusicListResponse(resultCount: resultCount, music: resultMusic);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['resultCount'] = resultCount;

    data['results'] = music?.map((v) => v.toJson()).toList();

    return data;
  }
}
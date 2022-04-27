import 'package:flutter_short_music/domain/entities/music.dart';

class MusicResponse extends Music {

  const MusicResponse({
    required String artistName,
      required String trackName,
      required String collectionName,
      required String previewUrl,
      required String artworkUrl30
  }) : super(
            artistName: artistName,
            trackName: trackName,
            collectionName: collectionName,
            previewUrl: previewUrl,
            artworkUrl30: artworkUrl30);

  factory MusicResponse.fromJson(Map<String, dynamic> json) {
    return MusicResponse(
        artistName: json['artistName'] ?? '',
        trackName: json['trackName'] ?? '',
        collectionName: json['collectionName'] ?? '',
        previewUrl: json['previewUrl'] ?? '',
        artworkUrl30: json['artworkUrl30'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['artistName'] = artistName;
    data['trackName'] = trackName;
    data['previewUrl'] = previewUrl;
    data['artworkUl100'] = artworkUrl30;
    return data;
  }

}

import 'package:equatable/equatable.dart';

class Music extends Equatable {
  final String artistName;
  final String trackName;
  final String collectionName;
  final String previewUrl;
  final String artworkUrl30;

  const Music({
    required this.artistName,
    required this.trackName,
    required this.collectionName,
    required this.previewUrl,
    required this.artworkUrl30
  });

  @override
  List<Object?> get props => [
    artistName,
    trackName,
    collectionName,
    previewUrl,
    artworkUrl30
  ];

  @override
  bool? get stringify => true;

}
import 'package:fpdart/fpdart.dart';

import '../../common/error/failures.dart';
import '../entities/music.dart';

abstract class MusicRepository {
  Future<Either<Failure, List<Music>?>> getMusicBySearch({
    required String searchQuery,
  });
}
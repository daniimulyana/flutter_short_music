import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_short_music/common/error/exception.dart';
import 'package:http/http.dart';

class MusicApi {
  final Client _client;
  static const host = 'https://itunes.apple.com/search?entity=song&media=music&limit=20&term=';

  MusicApi(this._client);

  dynamic get(String keyword) async {
    final Response response = await _client.get(
      Uri.parse(host+keyword.replaceAll(" ", "+")),
      headers: {
        'Content-Type': 'application/json',
        'charset': 'utf-8',
      },
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('Status Code: ' + response.statusCode.toString());
        print('URL Request: ' + response.request.toString());
      }
      return jsonDecode(response.body);
    } else {
      throw ServerException();
    }
  }
}
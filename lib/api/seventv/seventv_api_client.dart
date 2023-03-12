import 'dart:convert';

import 'package:feels_dank_man/api/seventv/seventv_emote.dart';
import 'package:feels_dank_man/core/http_client.dart';
import 'package:feels_dank_man/model/emote.dart';

abstract class ISeventvApiClient {
  Future<List<SeventvEmote>> getChannelEmotes(String channelId);
  Future<List<SeventvEmote>> getGlobalEmotes();
}

// TODO: impl
class SeventvApiClientImpl implements ISeventvApiClient {
  IHttpClient httpClient;

  String domain = '7tv.io';
  String basePath = 'v3/users/twitch/';

  SeventvApiClientImpl({
    required this.httpClient,
  });

  @override
  Future<List<SeventvEmote>> getChannelEmotes(String channelId) async {
    final res = await httpClient.get(domain, basePath + channelId);

    // TODO: error handling
    final body = jsonDecode(res.body);
    final rawEmoteSet = body['emote_set'];
    final emoteSet = SeventvEmoteSet.fromJson(rawEmoteSet);

    return emoteSet.emotes;
  }

  @override
  Future<List<SeventvEmote>> getGlobalEmotes() {
    // TODO: implement getGlobalEmotes
    throw UnimplementedError();
  }
}

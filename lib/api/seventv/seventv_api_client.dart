import 'dart:convert';

import 'package:feels_dank_man/api/seventv/seventv_emote.dart';
import 'package:feels_dank_man/core/http_client.dart';

abstract class ISeventvApiClient {
  Future<List<SeventvEmote>> getChannelEmotes(String channelId);
  Future<List<SeventvEmote>> getGlobalEmotes();
}

// TODO: impl
class SeventvApiClientImpl implements ISeventvApiClient {
  IHttpClient httpClient;

  String domain = '7tv.io';
  String userEmoteSetBasePath = 'v3/users/twitch/';
  String globalEmoteSetPath = 'v3/emote-sets/global';

  SeventvApiClientImpl({
    required this.httpClient,
  });

  @override
  Future<List<SeventvEmote>> getChannelEmotes(String channelId) async {
    // TODO: error handling
    final res = await httpClient.get(domain, userEmoteSetBasePath + channelId);
    final body = jsonDecode(res.body);
    final rawEmoteSet = body['emote_set'];
    final emoteSet = SeventvEmoteSet.fromJson(rawEmoteSet);

    return emoteSet.emotes;
  }

  @override
  Future<List<SeventvEmote>> getGlobalEmotes() async {
    // TODO: error handling
    final res = await httpClient.get(domain, globalEmoteSetPath);
    final body = jsonDecode(res.body);
    final rawEmoteSet = body;
    final emoteSet = SeventvEmoteSet.fromJson(rawEmoteSet);

    return emoteSet.emotes;
  }
}

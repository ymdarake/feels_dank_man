import 'package:feels_dank_man/model/emote_type.dart';

class Emote {
  Emote({
    required this.type,
    required this.id,
    required this.url,
    required this.scale,
  });

  EmoteType type;
  String id;
  String url;
  int scale;
}

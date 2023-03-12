// TODO: JsonSerializable ?
// TODO: build_runner setting

class SeventvEmoteSet {
  SeventvEmoteSet({
    required this.emotes,
  });

  List<SeventvEmote> emotes;

  factory SeventvEmoteSet.fromJson(Map<String, dynamic> json) {
    final emotes = json['emotes'] as List;
    return SeventvEmoteSet(
      emotes: emotes
          .map((e) => SeventvEmote.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

// TODO: impl GenericEmote?
class SeventvEmote {
  SeventvEmote({
    required this.id,
    required this.name,
    required this.flags,
    required this.data,
  });

  String id;
  String name;
  int flags;
  SeventvEmoteData data;

  String? get firstWebpUrl {
    String webpName = '';
    for (final file in data.host.files) {
      if (file.name.endsWith('.webp')) {
        webpName = file.name;
        break;
      }
    }
    if (webpName.isEmpty) {
      return null;
    }

    return 'https:${data.host.url}/$webpName';
  }

  factory SeventvEmote.fromJson(Map<String, dynamic> json) {
    return SeventvEmote(
      id: json['id'],
      name: json['name'],
      flags: json['flags'],
      data: SeventvEmoteData.fromJson(json['data']),
    );
  }

  @override
  String toString() {
    return 'SeventvEmote{ id="$id", name="$name", data=$data }';
  }
}

class SeventvEmoteData {
  SeventvEmoteData({
    required this.id,
    required this.name,
    required this.flags,
    required this.host,
  });

  String id;
  String name;
  int flags;
  SeventvEmoteHost host;

  factory SeventvEmoteData.fromJson(Map<String, dynamic> json) {
    return SeventvEmoteData(
      id: json['id'],
      name: 'name',
      flags: json['flags'],
      host: SeventvEmoteHost.fromJson(json['host']),
    );
  }

  @override
  String toString() {
    return 'SeventvEmoteData{ id="$id", name="$name", host=$host }';
  }
}

class SeventvEmoteHost {
  SeventvEmoteHost({
    required this.url,
    required this.files,
  });

  String url;
  List<SeventvEmoteFile> files;

  factory SeventvEmoteHost.fromJson(Map<String, dynamic> json) {
    final files = json['files'] as List;
    return SeventvEmoteHost(
      url: json['url'],
      files: files
          .map((e) => SeventvEmoteFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'SeventvEmoteHost{ url="$url", files=[${files.map((e) => e.name).join(",")}] }';
  }
}

class SeventvEmoteFile {
  SeventvEmoteFile({
    required this.name,
    required this.format,
  });

  String name;
  String format; // extension

  factory SeventvEmoteFile.fromJson(Map<String, dynamic> json) {
    return SeventvEmoteFile(name: json['name'], format: json['format']);
  }
}

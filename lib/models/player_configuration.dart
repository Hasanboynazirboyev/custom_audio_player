import 'dart:core';

class PlayerConfiguration {
  const PlayerConfiguration({
    required this.url,
  });

  final String url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;

    return map;
  }

  @override
  String toString() => 'PlayerConfiguration{'
      'url: $url, '
      '}';
}

// ignore_for_file: file_names

class Title {
  Title({
    required this.ar,
    required this.en,
  });

  Title.fromJson(dynamic json) {
    ar = json['ar'];
    en = json['en'];
  }

  late String ar;
  late String en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ar'] = ar;
    map['en'] = en;
    return map;
  }
}

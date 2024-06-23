class Links {
  Links({
      this.url, 
      required this.label,
      required this.active,});

  Links.fromJson(dynamic json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
  late dynamic url;
  late String label;
  late bool active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['label'] = label;
    map['active'] = active;
    return map;
  }

}
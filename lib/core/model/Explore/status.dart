// ignore_for_file: file_names

class Status {
  final String type;

  Status({
    required this.type,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      type: json['type'] ?? '0',
    );
  }
}

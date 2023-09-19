class Time {
  final String updated;
  final String updatedISO;
  final String updatedUK;

  Time(
      {required this.updated,
      required this.updatedISO,
      required this.updatedUK});

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      updated: json['updated'] ?? '',
      updatedISO: json['updatedISO'] ?? '',
      updatedUK: json['updateduk'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['updated'] = updated;
    data['updatedISO'] = updatedISO;
    data['updateduk'] = updatedUK;
    return data;
  }
}

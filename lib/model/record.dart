import 'dart:convert';

import 'package:meta/meta.dart';

class Record {
  String recordId;
  String userEmail;
  String title;
  String pictureUrl;
  String date;
  Record({
    @required this.recordId,
    @required this.userEmail,
    @required this.title,
    @required this.pictureUrl,
    @required this.date,
  });

  Record copyWith({
    String recordId,
    String userEmail,
    String title,
    String pictureUrl,
    String date,
  }) {
    return Record(
      recordId: recordId ?? this.recordId,
      userEmail: userEmail ?? this.userEmail,
      title: title ?? this.title,
      pictureUrl: pictureUrl ?? this.pictureUrl,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'recordId': recordId,
      'userEmail': userEmail,
      'title': title,
      'pictureUrl': pictureUrl,
      'date': date,
    };
  }

  static Record fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Record(
      recordId: map['recordId'],
      userEmail: map['userEmail'],
      title: map['title'],
      pictureUrl: map['pictureUrl'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  static Record fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(recordId: $recordId, userEmail: $userEmail, title: $title, pictureUrl: $pictureUrl, date: $date)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Record &&
        o.recordId == recordId &&
        o.userEmail == userEmail &&
        o.title == title &&
        o.pictureUrl == pictureUrl &&
        o.date == date;
  }

  @override
  int get hashCode {
    return recordId.hashCode ^
        userEmail.hashCode ^
        title.hashCode ^
        pictureUrl.hashCode ^
        date.hashCode;
  }
}

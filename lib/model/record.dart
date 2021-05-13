import 'dart:convert';

import 'package:meta/meta.dart';

class Record {
  String userId;
  String userEmail;
  String title;
  String pictureUrl;
  String date;
  Record({
    @required this.userId,
    @required this.userEmail,
    @required this.title,
    @required this.pictureUrl,
    @required this.date,
  });

  Record copyWith({
    String postId,
    String posterEmail,
    String description,
    String pictureUrl,
    String time,
  }) {
    return Record(
      userId: postId ?? this.userId,
      userEmail: posterEmail ?? this.userEmail,
      title: description ?? this.title,
      pictureUrl: pictureUrl ?? this.pictureUrl,
      date: time ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'postId': userId,
      'posterEmail': userEmail,
      'description': title,
      'pictureUrl': pictureUrl,
      'time': date,
    };
  }

  static Record fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Record(
      userId: map['postId'],
      userEmail: map['posterEmail'],
      title: map['description'],
      pictureUrl: map['pictureUrl'],
      date: map['time'],
    );
  }

  String toJson() => json.encode(toMap());

  static Record fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(postId: $userId, posterEmail: $userEmail, description: $title, pictureUrl: $pictureUrl, time: $date)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Record &&
        o.userId == userId &&
        o.userEmail == userEmail &&
        o.title == title &&
        o.pictureUrl == pictureUrl &&
        o.date == date;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        userEmail.hashCode ^
        title.hashCode ^
        pictureUrl.hashCode ^
        date.hashCode;
  }
}

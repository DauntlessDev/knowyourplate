import 'dart:convert';

import 'package:flutter/foundation.dart';

class Profile {
  final String uid;
  final String email;
  final String displayName;
  final String photoUrl;
  final int records;

  Profile(
      {@required this.uid,
      @required this.email,
      @required this.displayName,
      @required this.photoUrl,
      @required this.records});

  Profile copyWith({
    String uid,
    String email,
    String displayName,
    String photoUrl,
    int posts,
    int followers,
    int following,
    List<String> caseSearch,
  }) {
    return Profile(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      records: posts ?? this.records,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'posts': records,
    };
  }

  static Profile fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Profile(
      uid: map['uid'],
      email: map['email'],
      displayName: map['displayName'],
      photoUrl: map['photoUrl'],
      records: map['posts'],
    );
  }

  String toJson() => json.encode(toMap());

  static Profile fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Profile(uid: $uid, email: $email, displayName: $displayName, photoUrl: $photoUrl, posts: $records)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Profile &&
        o.uid == uid &&
        o.email == email &&
        o.displayName == displayName &&
        o.photoUrl == photoUrl &&
        o.records == records;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        email.hashCode ^
        displayName.hashCode ^
        photoUrl.hashCode ^
        records.hashCode;
  }
}

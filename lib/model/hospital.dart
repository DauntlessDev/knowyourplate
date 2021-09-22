import 'dart:convert';

import 'package:flutter/foundation.dart';

class Hospital {
  final String uid;
  final String email;
  final String hospName;
  final String photoUrl;
  final String adminName;
  final String address;
  final int patients;
  final List<String> caseSearch;

  Hospital({
    @required this.uid,
    @required this.email,
    @required this.hospName,
    @required this.photoUrl,
    @required this.patients,
    @required this.adminName,
    @required this.address,
    @required this.caseSearch,
  });

  Hospital copyWith({
    String uid,
    String email,
    String hospName,
    String photoUrl,
    int patients,
    String address,
    String familyHealthHistory,
    List<String> caseSearch,
  }) {
    return Hospital(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      hospName: hospName ?? this.hospName,
      photoUrl: photoUrl ?? this.photoUrl,
      patients: patients ?? this.patients,
      adminName: adminName ?? this.adminName,
      address: address ?? this.address,
      caseSearch: caseSearch ?? this.caseSearch,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'hospName': hospName,
      'photoUrl': photoUrl,
      'patients': patients,
      'adminName': adminName,
      'address': address,
      'caseSearch': caseSearch,
    };
  }

  static Hospital fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Hospital(
      uid: map['uid'],
      email: map['email'],
      hospName: map['hospName'],
      photoUrl: map['photoUrl'],
      patients: map['patients'],
      adminName: map['adminName'],
      address: map['address'],
      caseSearch: List<String>.from(map['caseSearch']),
    );
  }

  String toJson() => json.encode(toMap());

  static Hospital fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Profile(uid: $uid, email: $email, hospName: $hospName, photoUrl: $photoUrl, patients: $patients, adminName: $adminName, address: $address, caseSearch: $caseSearch)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Hospital &&
        o.uid == uid &&
        o.email == email &&
        o.hospName == hospName &&
        o.photoUrl == photoUrl &&
        o.patients == patients &&
        o.adminName == adminName &&
        o.address == address &&
        listEquals(o.caseSearch, caseSearch);
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        email.hashCode ^
        hospName.hashCode ^
        photoUrl.hashCode ^
        patients.hashCode ^
        adminName.hashCode ^
        address.hashCode ^
        caseSearch.hashCode;
  }
}

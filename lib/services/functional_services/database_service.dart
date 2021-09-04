import 'dart:io';

import 'package:flutter/foundation.dart';
// import 'package:knowyourplate/model/message.dart';
// import 'package:knowyourplate/model/post.dart';
import 'package:knowyourplate/model/profile.dart';
import 'package:knowyourplate/model/record.dart';
import 'package:knowyourplate/services/state_services/current_user_service.dart';
// import 'package:knowyourplate/services/state_services/current_chatroom_service.dart';
// import 'package:knowyourplate/services/state_services/current_user_service.dart';

import 'api_path.dart';
import 'firebase_service.dart';

class DatabaseService {
  DatabaseService._();
  static final instance = DatabaseService._();

  final _service = FirebaseService.instance;
  final _user = CurrentUserService.instance;

  Future<File> getImage() async {
    return await _service.getImage();
  }

  // Future<String> uploadProfilePic({@required File image}) async {
  //   String _uid = _user.uid;
  //   return _service.uploadPic(image: image, path: APIPath.profilePic(_uid));
  // }

  Future<String> uploadPostPicture(
      {@required File image, @required String recordId}) async {
    return _service.uploadPic(
        image: image, path: APIPath.postPicture(recordId));
  }

  Future<void> setProfile(Profile profile) async {
    await _service.setData(
      path: APIPath.userInfo(profile.uid),
      data: profile.toMap(),
    );
  }

  Stream<Profile> profileStream() {
    String _uid = _user.uid;
    return _service.documentStreamNoID(
      path: APIPath.userInfo(_uid),
      builder: (data) => Profile.fromMap(data),
    );
  }

  Future<List<Profile>> profileFuture({@required String email}) {
    return _service.collectionFuture<Profile>(
      path: APIPath.users(),
      builder: (data) => Profile.fromMap(data),
      queryBuilder: (query) => query.where('email', isEqualTo: email),
    );
  }

  Future<List<Profile>> usersFuture(String searchInput) {
    return _service.collectionFuture<Profile>(
        path: APIPath.users(),
        builder: (data) => Profile.fromMap(data),
        queryBuilder: (query) =>
            query.where('caseSearch', arrayContains: searchInput));
  }

  Future<void> setRecord({@required Record record}) async {
    await _service.setData(
      path: APIPath.record(record.recordId),
      data: record.toMap(),
    );
  }

  

  Stream<List<Record>> specificRecordStream(String email) {
    return _service.collectionStreamNoID(
      path: APIPath.records(),
      builder: (data) => Record.fromMap(data),
      sort: (a, b) => a.date.compareTo(b.date),
      queryBuilder: (query) => query.where('userEmail', isEqualTo: email),
      isReversed: true,
    );
  }
}

import 'package:knowyourplate/model/profile.dart';
import 'package:knowyourplate/model/record.dart';
import 'package:meta/meta.dart';


class RecordProfile {
  final Record record;
  final Profile userProfile;

  RecordProfile({@required this.record, @required this.userProfile});
}
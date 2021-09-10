import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowyourplate/model/record.dart';
import 'package:knowyourplate/services/state_services/formatter_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:knowyourplate/ui/widgets/smart_widgets/user/record_content.dart';

class UserRecord extends StatelessWidget {
  UserRecord({
    Key key,
    @required this.record,
  }) : super(key: key);

  final Record record;
  final _formatter = FormatterService.instance;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecordContent(
              record: record,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: <Widget>[
                Image(
                  image: CachedNetworkImageProvider(record.pictureUrl),
                  width: 50,
                  height: 50,
                  fit: BoxFit.fitHeight,
                ),
                // Container(
                //   color: Colors.lightGreenAccent,
                //   width: 50,
                //   height: 50,
                // ),
                SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 15),
                    Text(
                      record.title.length < 25
                          ? record.title
                          : '${record.title.substring(0, 22)}...',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _formatter.formatDate(record.date),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

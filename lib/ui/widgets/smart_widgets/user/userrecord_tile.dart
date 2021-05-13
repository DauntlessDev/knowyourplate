import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowyourplate/model/recordprofile.dart';

class UserRecord extends StatelessWidget {
  const UserRecord({
    Key key,
    @required this.recordProfile,
  }) : super(key: key);

  final RecordProfile recordProfile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              // Image(
              //   image: AssetImage(pictureUrl),
              //   height: 150,
              //   width: 100,
              //   fit: BoxFit.fitHeight,
              // ),
              Container(
                color: Colors.lightGreenAccent,
                width: 50,
                height: 50,
              ),
              SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 15),
                  Text(
                    recordProfile.record.title.length < 25
                        ? recordProfile.record.title
                        : '${recordProfile.record.title.substring(0, 22)}...',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    recordProfile.record.date,
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
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:knowyourplate/model/record.dart';
// import 'package:knowyourplate/services/functional_services/ar_service.dart'

class ARRecord extends StatefulWidget {
  ARRecord({
    Key key,
    @required this.record,
  }) : super(key: key);

  final Record record;

  @override
  _ARRecordState createState() => _ARRecordState();
}

class _ARRecordState extends State<ARRecord> {

  // TODO: ARCore functions

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        // TODO: ADD ARCoreView here
        Container(
          color: Colors.green,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image:
                          CachedNetworkImageProvider(widget.record.pictureUrl),
                      width: 200,
                      height: 200,
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                        child: Text("Food: ${widget.record.title}"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.red,
                                child: SizedBox(
                                  width: 16.0,
                                  height: 16.0,
                                ),
                              ),
                              Text("CHO"),
                              Text("${widget.record.carbs}"),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.orange,
                                child: SizedBox(
                                  width: 16.0,
                                  height: 16.0,
                                ),
                              ),
                              Text("PRO"),
                              Text("${widget.record.protein}"),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.blue,
                                child: SizedBox(
                                  width: 16.0,
                                  height: 16.0,
                                ),
                              ),
                              Text("FAT"),
                              Text("${widget.record.fats}"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

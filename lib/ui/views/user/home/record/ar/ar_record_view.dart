import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:knowyourplate/model/record.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

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
  ArCoreController arCoreController;

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;

    _addCylindre(arCoreController);
    _addCylindre2(arCoreController);
    _addCylindre3(arCoreController);
  }

  void _addCylindre(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Colors.red,
      reflectance: 1.0,
    );
    final cylindre = ArCoreCylinder(
      materials: [material],
      radius: 0.5,
      height: 0.1,
    );
    final node = ArCoreNode(
      shape: cylindre,
      position: vector.Vector3(0.0, -0.5, -3.0),
    );
    controller.addArCoreNode(node);
  }
  void _addCylindre2(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Colors.green,
      reflectance: 1.0,
    );
    final cylindre = ArCoreCylinder(
      materials: [material],
      radius: 0.2,
      height: 0.1,
    );
    final node = ArCoreNode(
      shape: cylindre,
      position: vector.Vector3(0.5, -0.5, -3.0),
    );
    controller.addArCoreNode(node);
  }
  void _addCylindre3(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Colors.blue,
      reflectance: 1.0,
    );
    final cylindre = ArCoreCylinder(
      materials: [material],
      radius: 0.7,
      height: 0.1,
    );
    final node = ArCoreNode(
      shape: cylindre,
      position: vector.Vector3(-0.5, -0.5, -3.0),
    );
    controller.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        // TODO: ADD ARCoreView here
        ArCoreView(
            onArCoreViewCreated: _onArCoreViewCreated,
        ),
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

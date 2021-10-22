import 'package:flutter/material.dart';
import 'package:knowyourplate/model/disease.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DetailedResultView extends StatelessWidget {
  final Disease disease;

  const DetailedResultView({Key key, this.disease}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Detailed Information"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Card(
            color: Colors.blueGrey[50],
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Icon(MdiIcons.diabetes),
                    title: Text(disease.name),
                    subtitle: Text(disease.probability),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(disease.desc),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                    child: Text(disease.longDesc),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

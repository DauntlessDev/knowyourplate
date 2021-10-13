import 'package:flutter/material.dart';
import 'package:knowyourplate/model/disease.dart';
import 'package:knowyourplate/ui/views/user/home/prediction/result/detailedresult_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DiseaseCard extends StatelessWidget {
  const DiseaseCard({
    Key key,
    @required this.disease,
  }) : super(key: key);

  final Disease disease;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[50],
      margin: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            //TODO: [OPTIONAL] add conditions for icons for each disease
            leading: Icon(MdiIcons.diabetes),
            title: Text(disease.name),
            subtitle: Text(disease.probability),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(disease.desc),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 10),
                      primary: Colors.green[700],
                      padding: EdgeInsets.all(10)),
                  onPressed: () {
                    print("Okay");

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailedResultView(disease: disease)),
                    );
                  },
                  child: const Text("More Details"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

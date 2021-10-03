import 'package:flutter/material.dart';
import 'package:knowyourplate/ui/views/user/home/prediction/result/detailedresult_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DiseaseCard extends StatelessWidget {
  const DiseaseCard({
    Key key,
    @required this.background,
    @required this.Disease,
  }) : super(key: key);

  final Color background;
  final String Disease;

  // TODO: Replace with actual data
  static const dummy_string =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras metus elit, egestas vel aliquet nec, rhoncus in dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Etiam elementum urna vel nisl bibendum suscipit";

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[50],
      margin: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            leading: Icon(MdiIcons.diabetes),
            title: Text("Disease Name"),
            subtitle: Text("Disease Probability"),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(dummy_string),
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
                          builder: (context) => DetailedResultView()),
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

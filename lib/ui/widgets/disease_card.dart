import 'package:flutter/material.dart';

class DiseaseCard extends StatelessWidget {
  const DiseaseCard({Key key}) : super(key: key);
  // TODO: Replace with actual data
  static const dummy_string =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras metus elit, egestas vel aliquet nec, rhoncus in dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Etiam elementum urna vel nisl bibendum suscipit";

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      margin: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            leading: Icon(Icons.info),
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
                  onPressed: () {
                    print("Okay");
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

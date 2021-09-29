import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:knowyourplate/model/ingredient.dart';
import 'package:knowyourplate/model/record.dart';

class RecordMainContent extends StatelessWidget {
  RecordMainContent({
    Key key,
    @required this.record,
  }) : super(key: key);

  final Record record;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text("Food: ${record.title}"),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image(
              image: CachedNetworkImageProvider(record.pictureUrl),
              width: 200,
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Carbohydrates: ${record.carbs}"),
              SizedBox(width: 10),
              Text("Protein: ${record.protein}"),
              SizedBox(width: 10),
              Text("Fats: ${record.fats}"),
            ],
          ),
          SizedBox(height: 30),
          Text("Ingredients: ${record.ingredients.toString()}"),
          Spacer(flex: 1),
          Text("Record of ${record.userEmail}"),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}

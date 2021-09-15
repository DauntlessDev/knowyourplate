import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:knowyourplate/model/record.dart';
import 'package:knowyourplate/services/state_services/formatter_service.dart';

class RecordContent extends StatelessWidget {
  const RecordContent({
    Key key,
    @required this.record,
  }) : super(key: key);

  final Record record;

  @override
  Widget build(BuildContext context) {
    print(record.toString());
    final _formatter = FormatterService.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text("Record Details"),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            Text("Food Title: ${record.title}"),
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
            Text("Record of ${record.userEmail}"),
            Text("Added on ${_formatter.formatDate(record.date)}"),
          ],
        ),
      ),
    );
  }
}
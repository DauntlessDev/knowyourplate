import 'package:flutter/material.dart';
import 'package:knowyourplate/ui/views/user/home/prediction/prediction_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PredictionView extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PredictionViewModel>.reactive(
      builder: (context, model, child) => _MainContent(),
      viewModelBuilder: () => PredictionViewModel(),
    );
  }
}

class _MainContent extends ViewModelWidget<PredictionViewModel> {
  const _MainContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, PredictionViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Health Prediction"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("How would you like your diet records to be predicted?"),
              ElevatedButton(
                onPressed: () {
                  print("3-Days");
                },
                child: Row(
                  children: [
                    Icon(Icons.today_sharp),
                    SizedBox(width: 16.0),
                    Text("3-Day Prediction"),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print("Weekly");
                },
                child: Row(
                  children: [
                    Icon(Icons.list_alt),
                    SizedBox(width: 16.0),
                    Text("Weekly Prediction"),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print("Monthly");
                },
                child: Row(
                  children: [
                    Icon(Icons.calendar_today_outlined),
                    SizedBox(width: 16.0),
                    Text("Monthly Prediction"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:knowyourplate/ui/views/user/home/prediction/prediction_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PredictionView extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PredictionViewModel>.reactive(
      viewModelBuilder: () => PredictionViewModel(),
      builder: (context, model, child) => _MainContent(),
    );
  }
}

class _MainContent extends ViewModelWidget<PredictionView> {
  const _MainContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, PredictionView viewModel) {
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: null,
                child: Row(
                  children: [
                    Icon(Icons.today_sharp),
                    Text("3-Day Prediction"),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: null,
                child: Row(
                  children: [
                    Icon(Icons.list_alt),
                    Text("Weekly Prediction"),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: null,
                child: Row(
                  children: [
                    Icon(Icons.calendar_today_outlined),
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

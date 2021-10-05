import 'package:flutter/material.dart';
import 'package:knowyourplate/ui/views/user/home/prediction/prediction_viewmodel.dart';
import 'package:knowyourplate/ui/views/user/home/prediction/result/result_view.dart';
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
  Widget build(BuildContext context, PredictionViewModel model) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Health Prediction"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(
                flex: 1,
              ),
              Text(
                "How would you like your diet records to be predicted?",
                style: const TextStyle(fontSize: 15),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Material(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(30.0),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: (model.recordcount < 2)
                        ? null
                        : () async {
                            print("3-Days");
                            model.result = await model.predictThreeDay();
                            print('result ${model.result}');
                            print('count ${model.recordcount}');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultView()),
                            );
                          },
                    minWidth: double.infinity,
                    height: 42.0,
                    child: Row(
                      children: [
                        Icon(
                          Icons.today_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(width: 16.0),
                        Text(
                          "3-Day Prediction",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Material(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(30.0),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: (model.recordcount < 7)
                        ? null
                        : () async {
                            print("Weekly");
                            await model.predictThreeDay();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultView()),
                            );
                          },
                    minWidth: double.infinity,
                    height: 42.0,
                    child: Row(
                      children: [
                        Icon(
                          Icons.list_alt,
                          color: Colors.white,
                        ),
                        SizedBox(width: 16.0),
                        Text(
                          "Weekly Prediction",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Material(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(30.0),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: (model.recordcount < 30)
                        ? null
                        : () async {
                            print("Monthly");
                            await model.predictThreeDay();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultView()),
                            );
                          },
                    minWidth: double.infinity,
                    height: 42.0,
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(width: 16.0),
                        Text(
                          "Monthly Prediction",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

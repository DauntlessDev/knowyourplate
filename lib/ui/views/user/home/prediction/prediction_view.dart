import 'package:flutter/material.dart';
import 'package:knowyourplate/ui/views/user/home/prediction/prediction_viewmodel.dart';
import 'package:knowyourplate/ui/views/user/home/prediction/result/result_view.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
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
  }) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, PredictionViewModel model) {
    return ModalProgressHUD(
      inAsyncCall: model.isBusy,
      child: Scaffold(
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
                  "How intense is your physical activity level? ",
                  style: const TextStyle(fontSize: 15),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "• Low - Activities where breathing is done easily \n\n• Moderate - Activities or movements where you can breathe comfortably while doing \n\n• Vigorous - Activities that involve intense movements where breathing is short while doing",
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                DropdownButton<String>(
                  value: model.intensity,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: model.setIntensity,
                  items: <String>['Low', 'Moderate', 'Vigorous']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 35),
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
                      onPressed: () async {
                        if (model.recordcount >= 3) {
                          print("3-Days");
                          model.result = await model.predictThreeDay();
                          print('result ${model.result}');
                          print('count ${model.recordcount}');

                          if (model.result != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ResultView(result: model.result)),
                            );
                          } else {
                            showDialog<void>(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Prediction Failed'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text('Error in predicting diseases'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Confirm'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                            print('error in login');
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'This prediction mode is unavailable, You only have ${model.recordcount} Records.'),
                            ),
                          );
                        }
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
                      onPressed: () async {
                        if (model.recordcount >= 7) {
                          print("Weekly");
                          model.result = await model.predictWeekly();
                          print('result ${model.result}');
                          print('count ${model.recordcount}');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ResultView(result: model.result)),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'This prediction mode is unavailable, You only have ${model.recordcount} Records.'),
                            ),
                          );
                        }
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
                      onPressed: () async {
                        if (model.recordcount >= 30) {
                          print("Monthly");
                          model.result = await model.predictMonthly();
                          print('result ${model.result}');
                          print('count ${model.recordcount}');

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Prediction Completed'),
                            ),
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ResultView(result: model.result)),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'This prediction mode is unavailable, You only have ${model.recordcount} Records.'),
                            ),
                          );
                        }
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
      ),
    );
  }
}

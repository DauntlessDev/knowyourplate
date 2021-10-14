import 'package:flutter/material.dart';
import 'package:knowyourplate/ui/views/user/home/record/ar/ar_record_view.dart';
import 'package:knowyourplate/ui/views/user/home/record/record_viewmodel.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:stacked/stacked.dart';

class RecordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecordViewModel>.reactive(
      viewModelBuilder: () => RecordViewModel(),
      onModelReady: (model) => model.getCurrentFoodInfo(),
      builder: (context, model, child) {
        return ModalProgressHUD(
          inAsyncCall: model.isBusy,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text('Food Information'),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add_circle_outline),
              onPressed: () async => {
                model.result = await model.proceedRecord(),
                // recordResult = await model.proceedRecord();
                if (model.result.title == 'Success')
                  {
                    Navigator.of(context).popUntil((route) => route.isFirst),
                  }
                else
                  {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(model.result.title),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text(model.result.details),
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
                    ),
                    print('error in adding record'),
                  },
              },
            ),
            body: _MainContent(),
          ),
        );
      },
    );
  }
}

class _MainContent extends ViewModelWidget<RecordViewModel> {
  const _MainContent({
    Key key,
  }) : super(key: key, reactive: false);

  @override
  Widget build(BuildContext context, RecordViewModel model) {
    return ARRecord(record: model.foodInfo);
  }
}

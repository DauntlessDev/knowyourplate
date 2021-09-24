import 'package:flutter/material.dart';
import 'package:knowyourplate/ui/views/user/home/record/record_viewmodel.dart';
import 'package:knowyourplate/ui/widgets/auth_textformfield.dart';
import 'package:knowyourplate/ui/widgets/roundedbutton.dart';
import 'package:stacked/stacked.dart';

class RecordView extends StatelessWidget {
  // This widget is the root of your application.@override
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecordViewModel>.reactive(
      viewModelBuilder: () => RecordViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: const _MainContent(),
                    ),
                  ],
                ),
              ],
            ),
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
    bool imageResult;
    bool recordResult;
    return AnimatedPadding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      duration: Duration(milliseconds: 220),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: <Widget>[
            Spacer(flex: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Add new record!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(flex: 1),
            RoundedButton(
              onPressed: () async => {
                await model.addImage(),
                // imageResult = await model.addImage();
                imageResult = true,
                if (imageResult)
                  {
                    print('success in adding image'),
                  }
                else
                  {
                    print('error in adding image'),
                  }
              },
              text: 'Add photo',
              color: Colors.lightGreenAccent,
            ),
            const Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}

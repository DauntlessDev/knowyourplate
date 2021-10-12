import 'package:flutter/material.dart';
import 'package:knowyourplate/ui/views/user/home/record/quantity/quantity_viewmodel.dart';
import 'package:knowyourplate/ui/widgets/auth_textformfield.dart';
import 'package:knowyourplate/ui/widgets/roundedbutton.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:stacked/stacked.dart';

import '../record_view.dart';

class QuantityView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuantityViewModel>.reactive(
      viewModelBuilder: () => QuantityViewModel(),
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        return ModalProgressHUD(
          inAsyncCall: model.isBusy,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: const _MainContent(),
            ),
          ),
        );
      },
    );
  }
}

class _MainContent extends ViewModelWidget<QuantityViewModel> {
  const _MainContent({
    Key key,
  }) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, QuantityViewModel model) {
    return AnimatedPadding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      duration: Duration(milliseconds: 220),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: <Widget>[
            Spacer(flex: 3),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Calculate Macronutrients!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(flex: 1),
            Text(
              "What is the type of the meat? ",
              style: const TextStyle(fontSize: 15),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "• Low fat meat - meat with no to trimmed off fat/skin  \n\n• Med fat meat - meat with less fat/skin included \n\n• High fat meat - meat with large fatty cuts (skin is included)",
                style: const TextStyle(fontSize: 12),
              ),
            ),
            DropdownButton<String>(
              value: model.meatType,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: model.setMeatType,
              items: <String>['Low', 'Med', 'High']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 70),
            Text(
              "Enter the meat and vegetable quantity in values of cups.",
              style: const TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
            _SignupForm(),
            const SizedBox(height: 20),
            RoundedButton(
              onPressed: () => {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Proceed Calculation'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text(
                                'Are you sure that you inputted the correct quantity?'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Confirm'),
                          onPressed: () {
                            model.result = model.calculateComponents();
                            if (model.result.title == 'Success') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RecordView()));
                            } else {
                              showDialog<void>(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
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
                              );
                              print('error in calculating');
                            }
                          },
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            print('cancelled calculation');
                          },
                          child: const Text('Cancel'),
                        ),
                      ],
                    );
                  },
                ),
              },
              text: 'Calculate',
              color: Theme.of(context).colorScheme.primary,
            ),
            const Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}

class _SignupForm extends ViewModelWidget<QuantityViewModel> {
  _SignupForm({
    Key key,
  }) : super(key: key, reactive: false);
  final FocusNode _meatNode = FocusNode();
  final FocusNode _vegetableNode = FocusNode();
  final FocusNode _milkNode = FocusNode();

  @override
  Widget build(BuildContext context, QuantityViewModel model) {
    return Form(
      child: Column(
        children: [
          (model.hasMeat)
              ? AuthTextFormField(
                  initialValue: model.meatQuantity,
                  hintString: 'Enter Meat Quantity',
                  onChanged: model.setMeatQuantity,
                  focusNode: _meatNode,
                  onEditingComplete: model.hasVegetable
                      ? _vegetableNode.requestFocus
                      : model.hasMilk
                          ? _milkNode.requestFocus
                          : model.calculateComponents,
                  textInputAction: TextInputAction.next,
                  iconData: MdiIcons.foodSteak,
                )
              : SizedBox(),
          (model.hasVegetable)
              ? AuthTextFormField(
                  initialValue: model.vegetableQuantity,
                  hintString: 'Enter Vegetable Quantity',
                  onChanged: model.setVegetableQuantity,
                  focusNode: _vegetableNode,
                  onEditingComplete: model.hasMilk
                      ? _milkNode.requestFocus
                      : model.calculateComponents,
                  textInputAction: TextInputAction.next,
                  iconData: MdiIcons.basket,
                )
              : SizedBox(),
          (model.hasMilk)
              ? AuthTextFormField(
                  initialValue: model.milkQuantity,
                  hintString: 'Enter Milk Quantity',
                  onChanged: model.setMilkQuantity,
                  focusNode: _milkNode,
                  onEditingComplete: model.calculateComponents,
                  textInputAction: TextInputAction.next,
                  iconData: MdiIcons.cup,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

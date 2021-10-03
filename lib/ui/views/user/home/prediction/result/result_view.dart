import 'package:flutter/material.dart';
import 'package:knowyourplate/ui/views/user/home/prediction/result/result_viewmodel.dart';
import 'package:knowyourplate/ui/widgets/disease_card.dart';
import 'package:stacked/stacked.dart';

class ResultView extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        builder: (context, model, child) => _MainContent(
              diseases: List<DiseaseCard>.generate(5, (index) => DiseaseCard()),
            ),
        viewModelBuilder: () => ResultViewModel());
  }
}

class _MainContent extends ViewModelWidget<ResultViewModel> {
  // TODO: Get list from model
  final List<DiseaseCard> diseases;
  const _MainContent({
    Key key,
    @required this.diseases,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ResultViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Prediction Result"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        itemCount: diseases.length,
        itemBuilder: (BuildContext context, int index) {
          return diseases[index];
        },
      ),
    );
  }
}

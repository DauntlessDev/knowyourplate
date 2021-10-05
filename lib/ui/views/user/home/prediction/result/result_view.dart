import 'package:flutter/material.dart';
import 'package:knowyourplate/model/disease.dart';
import 'package:knowyourplate/model/result.dart';
import 'package:knowyourplate/ui/views/user/home/prediction/result/result_viewmodel.dart';
import 'package:knowyourplate/ui/widgets/disease_card.dart';
import 'package:stacked/stacked.dart';

class ResultView extends StatelessWidget {
  final Result result;

  const ResultView({Key key, @required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        builder: (context, model, child) => _MainContent(
              result: result,
            ),
        viewModelBuilder: () => ResultViewModel());
  }
}

class _MainContent extends ViewModelWidget<ResultViewModel> {
  final Result result;
  const _MainContent({
    Key key,
    @required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ResultViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Prediction Result"),
      ),
      body: SafeArea(child: DiseaseListBuilder(diseaselist: result.diseases)),
    );
  }
}

class DiseaseListBuilder extends StatelessWidget {
  const DiseaseListBuilder({
    Key key,
    @required this.diseaselist,
  }) : super(key: key);

  final List<Disease> diseaselist;

  @override
  Widget build(BuildContext context) {
    print('diseaselist : ${diseaselist.isEmpty}');
    if (diseaselist.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          Icon(
            Icons.celebration,
            size: 150,
            color: Colors.green,
          ),
          SizedBox(height: 15),
          Text(
            'Congrats! you are healthy & has no possible disease based on the diet record and mode you have chosen. Keep it up!  ',
            style: TextStyle(fontSize: 16),
          ),
        ]),
      );
    }
    return ListView.separated(
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container();
        }
        if (index == diseaselist.length + 1) return Container();
        return DiseaseCard(disease: diseaselist[index - 1]);
      },
      itemCount: diseaselist.length + 2,
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: Colors.grey,
        thickness: .2,
        height: .2,
      ),
    );
  }
}

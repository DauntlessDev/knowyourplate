import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';

import 'hosp_request_viewmodel.dart';

class UserRequestView extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HospRequestViewModel>.reactive(
      builder: (context, model, child) => _MainContent(),
      viewModelBuilder: () => HospRequestViewModel(),
    );
  }
}

class _MainContent extends ViewModelWidget<HospRequestViewModel> {
  const _MainContent({
    Key key,
  }) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, HospRequestViewModel model) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Transfer Requests',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                _HospRequest(
                  name: 'Brave Leuterio',
                  email: 'rom@gmail.com',
                  pictureUrl: '',
                ),
                _HospRequest(
                  name: 'Brave Leuterio',
                  email: 'rom@gmail.com',
                  pictureUrl: '',
                ),
                _HospRequest(
                  name: 'Brave Leuterio',
                  email: 'rom@gmail.com',
                  pictureUrl: '',
                ),
                _HospRequest(
                  name: 'Brave Leuterio',
                  email: 'rom@gmail.com',
                  pictureUrl: '',
                ),
                _HospRequest(
                  name: 'Brave Leuterio',
                  email: 'rom@gmail.com',
                  pictureUrl: '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HospRequest extends ViewModelWidget<HospRequestViewModel> {
  const _HospRequest({
    Key key,
    @required this.name,
    @required this.pictureUrl,
    @required this.email,
  }) : super(key: key, reactive: true);

  final String name;
  final String pictureUrl;
  final String email;

  @override
  Widget build(BuildContext context, HospRequestViewModel model) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              // Image(
              //   image: AssetImage(pictureUrl),
              //   height: 150,
              //   width: 100,
              //   fit: BoxFit.fitHeight,
              // ),
              Container(
                color: Colors.lightGreenAccent,
                width: 100,
                height: 100,
              ),
              SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 15),
                  Text(
                    name.length < 25 ? name : '${name.substring(0, 22)}...',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    email.length < 28
                        ? email
                        : '${email.substring(0, 25)}...',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ButtonTheme(
                          minWidth: 15,
                          height: 25,
                          child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.grey[400])),
                            child: Icon(MdiIcons.cancel,
                                size: 15, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 5),
                        ButtonTheme(
                          minWidth: 15,
                          height: 25,
                          child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.lightGreen)),
                            child: Icon(
                              MdiIcons.check,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

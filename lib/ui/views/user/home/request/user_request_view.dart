import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowyourplate/ui/views/user/home/request/user_request_viewmodel.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';

class UserRequestView extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserRequestViewModel>.reactive(
      builder: (context, model, child) => _MainContent(),
      viewModelBuilder: () => UserRequestViewModel(),
    );
  }
}

class _MainContent extends ViewModelWidget<UserRequestViewModel> {
  const _MainContent({
    Key key,
  }) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, UserRequestViewModel model) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.green,
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
                _UserRequest(
                  title: 'De La Salle HSI Hospital',
                  location: 'Dasmarinas, Cavite',
                  pictureUrl: '',
                ),
                _UserRequest(
                  title: 'De La Salle HSI Hospital',
                  location: 'Dasmarinas, Cavite',
                  pictureUrl: '',
                ),
                _UserRequest(
                  title: 'De La Salle HSI Hospital',
                  location: 'Dasmarinas, Cavite',
                  pictureUrl: '',
                ),
                _UserRequest(
                  title: 'De La Salle HSI Hospital',
                  location: 'Dasmarinas, Cavite',
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

class _UserRequest extends ViewModelWidget<UserRequestViewModel> {
  const _UserRequest({
    Key key,
    @required this.title,
    @required this.pictureUrl,
    @required this.location,
  }) : super(key: key, reactive: true);

  final String title;
  final String pictureUrl;
  final String location;

  @override
  Widget build(BuildContext context, UserRequestViewModel model) {
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
                    title.length < 25 ? title : '${title.substring(0, 22)}...',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    location.length < 28
                        ? location
                        : '${location.substring(0, 25)}...',
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
                                    MaterialStateProperty.all(Colors.green)),
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

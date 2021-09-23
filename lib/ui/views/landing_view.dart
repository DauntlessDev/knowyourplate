import 'package:flutter/material.dart';
import 'package:knowyourplate/ui/views/user/auth/userlogin/user_login_view.dart';
import 'package:knowyourplate/ui/views/user/home/user_home_view.dart';
import 'package:stacked/stacked.dart';

import 'landing_viewmodel.dart';

class LandingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LandingViewModel>.reactive(
      viewModelBuilder: () => LandingViewModel(),
      builder: (context, model, child) =>
          model.user == null ? UserLoginView() : UserHomeView(),
    );
  }
}

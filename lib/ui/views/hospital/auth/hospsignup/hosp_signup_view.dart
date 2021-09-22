import 'package:flutter/material.dart';
import 'package:knowyourplate/ui/views/user/auth/usersignup/user_signup_viewmode.dart';
import 'package:knowyourplate/ui/widgets/auth_textformfield.dart';
import 'package:knowyourplate/ui/widgets/roundedbutton.dart';
import 'package:knowyourplate/ui/widgets/tappable_richtext.dart';
import 'package:knowyourplate/ui/widgets/top_background.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';

import 'hosp_signup_viewmodel.dart';

class HospitalSignupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HospSignupViewModel>.reactive(
      viewModelBuilder: () => HospSignupViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              children: [
                TopBackground(),
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

class _MainContent extends ViewModelWidget<HospSignupViewModel> {
  const _MainContent({
    Key key,
  }) : super(key: key, reactive: false);

  @override
  Widget build(BuildContext context, HospSignupViewModel model) {
    bool result;
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
                'Create account, Admin!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(flex: 1),
            _SignupForm(),
            const SizedBox(height: 20),
            RoundedButton(
              onPressed: () async => {
                result = await model.signUpWithEmail(),
                if (result)
                  {
                    Navigator.of(context).popUntil((route) => route.isFirst),
                  }
                else
                  {
                    print('error in sign up'),
                  }
              },
              text: 'Continue',
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 30),
            TappableRichText(
              firstString: 'Already have an account? ',
              secondString: 'Login.',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}

class _SignupForm extends ViewModelWidget<HospSignupViewModel> {
  _SignupForm({
    Key key,
  }) : super(key: key, reactive: false);
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _adminNameFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context, HospSignupViewModel model) {
    return Form(
      child: Column(
        children: [
          AuthTextFormField(
            initialValue: model.hospName,
            hintString: 'Enter hospital name',
            onChanged: model.setHospName,
            focusNode: _nameFocusNode,
            onEditingComplete: _adminNameFocusNode.requestFocus,
            textInputAction: TextInputAction.next,
            iconData: MdiIcons.accountBox,
          ),
          AuthTextFormField(
            initialValue: model.adminName,
            hintString: 'Enter name of the admin ',
            onChanged: model.setAdminName,
            focusNode: _adminNameFocusNode,
            onEditingComplete: _addressFocusNode.requestFocus,
            textInputAction: TextInputAction.next,
            iconData: MdiIcons.briefcase,
          ),
          AuthTextFormField(
            initialValue: model.address,
            hintString: 'Enter hospital address',
            onChanged: model.setAddress,
            focusNode: _addressFocusNode,
            onEditingComplete: _emailFocusNode.requestFocus,
            textInputAction: TextInputAction.next,
            iconData: MdiIcons.familyTree,
          ),
          AuthTextFormField(
            initialValue: model.email,
            hintString: 'Enter email',
            keyBoardType: TextInputType.emailAddress,
            onChanged: model.setEmail,
            focusNode: _emailFocusNode,
            onEditingComplete: _passwordFocusNode.requestFocus,
            textInputAction: TextInputAction.next,
            iconData: Icons.person,
          ),
          AuthTextFormField(
            initialValue: model.password,
            hintString: 'Enter password',
            onChanged: model.setPassword,
            focusNode: _passwordFocusNode,
            onEditingComplete: _confirmPasswordFocusNode.requestFocus,
            textInputAction: TextInputAction.next,
            iconData: Icons.lock,
            obscureText: true,
          ),
          AuthTextFormField(
            initialValue: model.confirmPassword,
            hintString: 'Confirm password',
            onChanged: model.setConfirmPassword,
            focusNode: _confirmPasswordFocusNode,
            onEditingComplete: model.signUpWithEmail,
            textInputAction: TextInputAction.done,
            iconData: Icons.phone_locked,
            obscureText: true,
          ),
        ],
      ),
    );
  }
}

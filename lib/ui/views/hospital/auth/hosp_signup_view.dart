import 'package:flutter/material.dart';
import 'package:knowyourplate/ui/views/user/auth/usersignup/user_signup_viewmode.dart';
import 'package:knowyourplate/ui/widgets/auth_textformfield.dart';
import 'package:knowyourplate/ui/widgets/roundedbutton.dart';
import 'package:knowyourplate/ui/widgets/tappable_richtext.dart';
import 'package:knowyourplate/ui/widgets/top_background.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';

class HospitalSignupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserSignupViewModel>.reactive(
      viewModelBuilder: () => UserSignupViewModel(),
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

class _MainContent extends ViewModelWidget<UserSignupViewModel> {
  const _MainContent({
    Key key,
  }) : super(key: key, reactive: false);

  @override
  Widget build(BuildContext context, UserSignupViewModel model) {
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

class _SignupForm extends ViewModelWidget<UserSignupViewModel> {
  _SignupForm({
    Key key,
  }) : super(key: key, reactive: false);
  final FocusNode _displayFocusNode = FocusNode();
  final FocusNode _occupationFocusNode = FocusNode();
  final FocusNode _familyHistoryFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context, UserSignupViewModel model) {
    return Form(
      child: Column(
        children: [
          AuthTextFormField(
            initialValue: model.displayName,
            hintString: 'Enter hospital name',
            onChanged: model.setDisplayName,
            focusNode: _displayFocusNode,
            onEditingComplete: _occupationFocusNode.requestFocus,
            textInputAction: TextInputAction.next,
            iconData: MdiIcons.accountBox,
          ),
          AuthTextFormField(
            initialValue: model.occupation,
            hintString: 'Enter name of the admin ',
            onChanged: model.setOccupation,
            focusNode: _occupationFocusNode,
            onEditingComplete: _familyHistoryFocusNode.requestFocus,
            textInputAction: TextInputAction.next,
            iconData: MdiIcons.briefcase,
          ),
          AuthTextFormField(
            initialValue: model.familyHealthHistory,
            hintString: 'Enter hospital address',
            onChanged: model.setfamilyHealthHistory,
            focusNode: _familyHistoryFocusNode,
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

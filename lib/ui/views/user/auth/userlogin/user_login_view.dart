import 'package:flutter/material.dart';
import 'package:knowyourplate/ui/views/user/auth/usersignup/user_signup_view.dart';
import 'package:knowyourplate/ui/views/user/auth/userlogin/user_login_viewmodel.dart';
import 'package:knowyourplate/ui/widgets/auth_textformfield.dart';
import 'package:knowyourplate/ui/widgets/roundedbutton.dart';
import 'package:knowyourplate/ui/widgets/tappable_richtext.dart';
import 'package:knowyourplate/ui/widgets/top_background.dart';
import 'package:stacked/stacked.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class UserLoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserLoginViewModel>.reactive(
      viewModelBuilder: () => UserLoginViewModel(),
      builder: (context, model, child) => ModalProgressHUD(
        inAsyncCall: model.isBusy,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              TopBackground(),
              CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                      hasScrollBody: false, child: _MainContent()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MainContent extends ViewModelWidget<UserLoginViewModel> {
  _MainContent({
    Key key,
  }) : super(key: key, reactive: false);

  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context, UserLoginViewModel model) {
    return AnimatedPadding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      duration: Duration(milliseconds: 220),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            const Spacer(flex: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome back, User!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(flex: 1),
            _LoginForm(passwordFocusNode: _passwordFocusNode),
            const SizedBox(height: 20),
            RoundedButton(
              onPressed: () async => {
                model.result = await model.signInWithEmail(),
                if (model.result.title == 'Login Success')
                  {
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
                    print('error in login'),
                  }
              },
              text: 'Continue',
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 30),
            TappableRichText(
              firstString: 'Don\'t have an account? ',
              secondString: 'Create one.',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserSignupView()),
                );
              },
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends ViewModelWidget<UserLoginViewModel> {
  _LoginForm({
    Key key,
    @required this.passwordFocusNode,
  }) : super(key: key);
  final FocusNode passwordFocusNode;
  final FocusNode emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context, UserLoginViewModel model) {
    return Form(
      child: Column(
        children: [
          AuthTextFormField(
            initialValue: model.email,
            hintString: 'Enter email',
            keyBoardType: TextInputType.emailAddress,
            onChanged: model.setEmail,
            focusNode: emailFocusNode,
            onEditingComplete: passwordFocusNode.requestFocus,
            textInputAction: TextInputAction.next,
            iconData: Icons.person,
          ),
          AuthTextFormField(
            initialValue: model.password,
            hintString: 'Enter password',
            onChanged: model.setPassword,
            focusNode: passwordFocusNode,
            onEditingComplete: model.signInWithEmail,
            textInputAction: TextInputAction.next,
            iconData: Icons.lock,
            obscureText: true,
          ),
        ],
      ),
    );
  }
}

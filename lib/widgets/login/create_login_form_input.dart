import 'package:flutter/material.dart';
import 'package:rcn_solpe/widgets/login/create_login_button.dart';
import 'package:rcn_solpe/widgets/login/create_login_password.dart';
import 'package:rcn_solpe/widgets/login/create_username.dart';

class CreateLoginFormInputs extends StatelessWidget {
  const CreateLoginFormInputs({
    Key key,
    @required this.percentage,
    @required TextEditingController usernameController,
    @required TextEditingController pwsController,
    Function onLoginPressed,
  })  : _usernameController = usernameController,
        _pwsController = pwsController,
        _onLoginPressed = onLoginPressed,
        super(key: key);

  final double percentage;
  final TextEditingController _usernameController;
  final TextEditingController _pwsController;
  final Function _onLoginPressed;

  get formLoginKey => this.formLoginKey;

  @override
  Widget build(BuildContext context) {
    

    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        Container(
          width: size.width * percentage,
          child: CreateUserName(
            usernamecontroller: _usernameController,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          width: size.width * percentage,
          child: CreateLoginPassword(
            pwscontroller: _pwsController,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          width: size.width * percentage,
          child: CreateLoginButton(
            userNameController: _usernameController,
            pwsController: _pwsController,
            onLoginPressed: () => _onLoginPressed(),
          ),
        ),
      ],
    );
  }
}

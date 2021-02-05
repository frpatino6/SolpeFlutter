import 'package:flutter/material.dart';
import 'package:rcn_solpe/helpers/hexColor.dart';

class CreateLoginButton extends StatelessWidget {
  CreateLoginButton({
    @required userNameController,
    @required pwsController,
    Key key,
    Function onLoginPressed,
  })  : _userNameController = userNameController,
        _pwsController = pwsController,
        _onLoginPressed = onLoginPressed,
        super(key: key);
  final String primaryColor = '#14439b';
  final TextEditingController _userNameController;
  final TextEditingController _pwsController;
  final Function _onLoginPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return new OutlineButton(
      borderSide: BorderSide(
        color: Colors.blueGrey,
        style: BorderStyle.solid,
        width: 1.8,
      ),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0)),
      child: Text('Ingresar'),
      onPressed: () {
        _onLoginPressed();
      },
    );
  }
}

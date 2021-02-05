import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateLoginPassword extends StatelessWidget {
  const CreateLoginPassword({Key key, @required this.pwscontroller})
      : super(key: key);
  final TextEditingController pwscontroller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: pwscontroller,
        keyboardType: TextInputType.visiblePassword,
        autofocus: false,
        obscureText: true,
        onChanged: (value) {},
        validator: (value) {
          print(value);
          if (value.isEmpty) {
            return 'Por favor ingrese la contrasena';
          }
          return null;
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Password',
          labelText: 'Password',
          prefixIcon: Icon(Icons.lock_outline,color: Colors.white),
        ));
  }
}

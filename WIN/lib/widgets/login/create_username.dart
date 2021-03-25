import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateUserName extends StatelessWidget {
  const CreateUserName({Key? key, this.usernamecontroller}) : super(key: key);
  final TextEditingController? usernamecontroller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: usernamecontroller,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        validator: (value) {
          print(value);
          if (value!.isEmpty) {
            return 'Por favor ingrese el nombre de usuario';
          }
          return null;
        },
        onChanged: (value) {},
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'User',
          labelText: 'User',
          prefixIcon: Icon(Icons.account_circle,color: Colors.white),
        ));
  }
}

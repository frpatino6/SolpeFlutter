import 'package:flutter/material.dart';

class CreateBackground extends StatelessWidget {
  const CreateBackground({
    Key key,
    @required this.size,
  }) : super(key: key);
  final dynamic size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.44,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Image(
          width: size.width * 0.9,
          height: size.height * 0.9,
          image: AssetImage("assets/logo.png"),
        ),
      ),
    );
  }
}

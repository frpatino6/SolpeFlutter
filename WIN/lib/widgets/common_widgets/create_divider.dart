import 'package:flutter/material.dart';

class CreateDivider extends StatelessWidget {
  const CreateDivider({
    Key key,
     this.heightDivider = 1.2,
  }) : super(key: key);

  final double heightDivider;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey,
      thickness: heightDivider,
      indent: 0,
      endIndent: 0,
    );
  }
}

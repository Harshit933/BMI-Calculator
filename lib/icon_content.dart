import 'package:flutter/material.dart';
import 'constants.dart';


class Content extends StatelessWidget {
  Content(this.cono, this.label);

  final IconData cono;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cono,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label ,style: labelTextStyle,)
      ],
    );
  }
}

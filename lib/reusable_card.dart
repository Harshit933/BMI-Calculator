import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(this.colour, this.cardChild,this.onPress);

  final Color colour;
  final Widget cardChild;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        // height: 50.0,
        // width: 25.0,
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

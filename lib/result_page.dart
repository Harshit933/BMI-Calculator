import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {

  ResultPage(@required this.bmiresult, @required this.resultText, @required this.interpretation);

  final String bmiresult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "YOUR RESULT",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5, //takes up more space in the screen
            child: ReusableCard(
              kActiveCardColour,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kresultTextStyle,
                  ),
                  Text(
                    bmiresult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
                (){

                },
            ),
          ),
          BottomButton(
            buttonTitle:'RE-CALCULATE',
              onTap:
              (){
                Navigator.of(context).pop();
              },
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'constants.dart';

class ChildWidgetCustom extends StatelessWidget {
  const ChildWidgetCustom({required this.icony, required this.texty});

  final IconData icony;
  final String texty;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icony,
          size: 80,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          texty,
          style: kTextStyle,
        )
      ],
    );
  }
}

class MyRoundCustomBut extends StatelessWidget {
  const MyRoundCustomBut({this.icon, this.onpresseD});

  final IconData? icon;
  final VoidCallback? onpresseD;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: RawMaterialButton(
        onPressed: onpresseD,
        constraints: const BoxConstraints.tightFor(width: 50.0, height: 50.0),
        shape: CircleBorder(),
        fillColor: Color(0xFF4c4f5e),
        elevation: 10.0,
        child: Icon(icon),
      ),
    );
  }
}

class ButtomButton extends StatelessWidget {
  const ButtomButton({this.buttonName, this.onPressedd});

  final String? buttonName;
  final VoidCallback? onPressedd;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedd,
      child: Container(
        child: Center(
          child: Text(
            buttonName!,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 35,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: kBottomContainerColor,
          borderRadius: BorderRadius.circular(100.0),
        ),
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}

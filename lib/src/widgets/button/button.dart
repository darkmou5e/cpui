import 'dart:ui';

import 'package:flutter/material.dart';

import '../../colors/colors.dart';

class CPButton extends StatefulWidget {
  CPButton({Key key, this.caption, this.color}) : super(key: key);

  final String caption;
  final Color color;

  @override
  State<StatefulWidget> createState() => CPButtonState();
}

class CPButtonState extends State<CPButton> {
  bool _isPressed = false;

  pressButton() => setState(() {
        _isPressed = true;
      });

  unpressButton() => setState(() {
        _isPressed = false;
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (_) => pressButton(),
        onTapUp: (_) => unpressButton(),
        onTapCancel: unpressButton,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            color: _isPressed ? widget.color : CPColors.black,
            child: Text(
              widget.caption,
              style:
                  TextStyle(color: _isPressed ? CPColors.black : widget.color),
            )));
  }
}

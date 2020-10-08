import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            constraints: BoxConstraints(minHeight: 48, minWidth: 48),
            color: Colors.transparent,
            child: Center(
                widthFactor: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  color: _isPressed ? widget.color : CPColors.black,
                  child: Text(widget.caption,
                      style: GoogleFonts.exo2(
                        color: _isPressed ? CPColors.black : widget.color,
                        fontWeight: FontWeight.w300,
                      )),
                ))));
  }
}

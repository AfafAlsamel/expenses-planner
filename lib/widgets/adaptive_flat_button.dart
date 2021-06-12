import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  String _text;
  Function _handler;

  AdaptiveFlatButton(this._text, this._handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              _text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: _handler,
          )
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            child: Text(
              _text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: _handler,
          );
  }
}

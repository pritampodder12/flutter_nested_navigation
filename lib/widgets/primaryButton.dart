import 'package:flutter/material.dart';

import '../constants/index.dart';

Widget primaryButton(
        {BuildContext context, String title, Function onPressed}) =>
    Container(
        height: 40,
        width: double.infinity,
        child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: ColorNames.secondaryColor,
            elevation: 0,
            highlightElevation: 0,
            onPressed: onPressed,
            child: Text(title,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    fontFamily: "BlissPro"))));

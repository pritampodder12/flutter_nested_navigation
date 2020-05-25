import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/index.dart';
import '../constants/index.dart';

Future<void> showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: EdgeInsets.only(top: 0, right: 0),
        backgroundColor: ColorNames.primaryColor,
        title: Container(
          width: double.infinity,
          child: Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.warning,
                    color: ColorNames.primaryColor,
                    size: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Icon(
                      Icons.warning,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.grey,
                      size: 20,
                    ),
                  )
                ],
              )),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'Your product has been\nscanned 257 time(s) ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  height: 40,
                  width: 100,
                  child: RaisedButton(
                      child: Text('Go to settings'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Provider.of<HomeTabProvider>(context, listen: false)
                            .changeToScanTabAndNavigate('test_page');
                      }))
            ],
          ),
        ),
      );
    },
  );
}

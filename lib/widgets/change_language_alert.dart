import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/index.dart';
import '../constants/index.dart';

class ChangeLanguage extends StatefulWidget {
  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  String radioItem = 'en';

  Widget languageListItems(
          {BuildContext context,
          String title,
          String value,
          String groupValue}) =>
      Container(
          width: double.infinity,
          height: 50,
          child: InkWell(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.grey[850]),
                        ),
                        SizedBox(
                            width: 25,
                            child: Radio(
                              value: value,
                              groupValue: groupValue,
                              onChanged: (val) {},
                              activeColor: ColorNames.primaryColor,
                            ))
                      ],
                    ),
                    Divider(
                      height: 1,
                    ),
                  ],
                )),
            onTap: () {
              setState(() {
                radioItem = value;
              });
            },
          ));

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      contentPadding: EdgeInsets.all(0),
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  customBorder: CircleBorder(),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.settings, color: Colors.grey[600])),
                  onTap: () {
                    Navigator.pop(context);
                    if (Provider.of<HomeTabProvider>(context, listen: false)
                            .tabController
                            .index !=
                        1)
                      Provider.of<HomeTabProvider>(context, listen: false)
                          .changeToScanTabAndNavigate('settings');
                    // else if (!Provider.of<HomeTabProvider>(context,
                    //         listen: false)
                    //     .scanNavKey
                    //     .currentState
                    //     .canPop())
                    else
                      Provider.of<HomeTabProvider>(context, listen: false)
                          .scanNavKey
                          .currentState
                          .pushNamed('settings');
                  },
                ),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'Select Language',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Colors.cyan[900]),
                    )),
                InkWell(
                  customBorder: CircleBorder(),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.close, color: Colors.grey[600])),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            //),
            SizedBox(height: 10),
            languageListItems(
                context: context,
                title: 'EN',
                value: 'en',
                groupValue: radioItem),
            languageListItems(
                context: context,
                title: 'Chinese(Traditional)',
                value: 'chT',
                groupValue: radioItem),
            languageListItems(
                context: context,
                title: 'Chinese(Simplified)',
                value: 'chS',
                groupValue: radioItem),
            SizedBox(height: 50)
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/index.dart';
import '../constants/index.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: mainAppBar(
            context: context,
            leading: userIconButton(context),
            title: 'Settings',
            actions: [languageChangeIconButton(context)]),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: ColorNames.pageBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 15, right: 10, top: 10),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex: 1,
                          child: InkWell(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: ColorNames.primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Icon(
                                Icons.navigation,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            onTap: () {},
                          )),
                      Flexible(
                          flex: 6,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      child: Text(
                                    'Location',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.grey[850],
                                        fontWeight: FontWeight.w500),
                                  )),
                                  CupertinoSwitch(
                                    value: isSwitched,
                                    activeColor: ColorNames.green,
                                    onChanged: (bool val) {
                                      setState(() {
                                        isSwitched = val;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Divider(
                                height: 1,
                                thickness: 1,
                              )
                            ],
                          ))
                    ],
                  )),
              Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 10),
                  child: (RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 15,
                        color: ColorNames.primaryColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Version ',
                            style: TextStyle(
                                color: ColorNames.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                        TextSpan(
                            text: ' 3.5.8',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: ColorNames.darkGrey))
                      ],
                    ),
                  )))
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/index.dart';
import '../widgets/index.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorNames.primaryColor,
      appBar: mainAppBar(
        context: context,
        leading: userIconButton(context),
        actions: [languageChangeIconButton(context)],
        title: 'Login',
      ),
      body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: ht < 600
              ? SingleChildScrollView(
                  child: body(ht),
                )
              : body(ht)),
    );
  }

  Widget body(ht) {
    return Container(
      height: ht,
      width: double.infinity,
      child: Column(
        // start
        children: [
          Container(
              height: ht * 0.23,
              child: FractionallySizedBox(
                  heightFactor: ht <= 600 ? 1.5 : 1.2,
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 150,
                      width: 150,
                      child: Image(
                        image: AssetImage(ImageNames.zpIcon),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    // Text(
                    //   "eZTracker",
                    //   style: TextStyle(
                    //       fontSize: 15,
                    //       color: Colors.white,
                    //       fontFamily: "BlissPro",
                    //       fontWeight: FontWeight.w300),
                    // )
                  ]))),
          Container(
              margin: EdgeInsets.only(top: ht < 600 ? 20 : 0),
              height: ht < 600 ? ht * 0.45 : ht * 0.35,
              child: FractionallySizedBox(
                  heightFactor: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // TextFields
                    children: [
                      Container(
                          padding: EdgeInsets.all(20),
                          child: textInput("Email/Username", 1, 1,
                              TextInputType.emailAddress, false)),
                      Container(
                          padding: EdgeInsets.all(20),
                          child: textInput(
                              "Password", 1, 1, TextInputType.text, true)),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        width: MediaQuery.of(context).size.width,
                        child: primaryButton(
                            title: 'Sign In',
                            context: context,
                            onPressed: () {
                              // loginStatus.loginStatus("logged_in");
                              // skipTab.tabName("scan");
                              // Scaffold.of(context).showSnackBar(SnackBar(
                              //   behavior: SnackBarBehavior.floating,
                              //   elevation: 6.0,
                              //   shape: RoundedRectangleBorder(
                              //       borderRadius:
                              //           BorderRadius.all(Radius.circular(20))),
                              //   content: Text(
                              //     'Successfully login',
                              //     textAlign: TextAlign.center,
                              //   ),
                              //   duration: Duration(seconds: 3),
                              // ));
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  "scan", (Route<dynamic> route) => false);
                            }),
                      ),
                      InkWell(
                        child: Text("Forgot your Password?",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                      )
                    ],
                  ))),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(top: 40),
                  height: ht,
                  color: Colors.grey[200],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        width: MediaQuery.of(context).size.width,
                        child: primaryButton(
                            title: 'Continue as Guest',
                            context: context,
                            onPressed: () {
                              // TabMainPageState().buildOffstageNavigator(TabItem.scan);
                              // skipTab.tabName("scan");
                              // Navigator.of(context).pushNamed("scan");
                            }),
                      ),
                      InkWell(
                        // onTap: () =>
                        //     Navigator.of(context).pushNamed(RouterName.SIGN_UP),
                        child: Container(
                            //margin: EdgeInsets.only(bottom: 10),
                            child: Text("Don't have an accout? Sign up",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[600]))),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // )
                    ],
                  ))),
        ],
      ),
    );
  }

  Widget textInput(label, minLines, maxLines, type, pass) {
    return TextField(
      minLines: minLines,
      maxLines: maxLines,
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: ColorNames.primaryColor,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),
      keyboardType: type,
      obscureText: pass,
      decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          fillColor: Colors.blueGrey[50],
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
              borderSide: BorderSide(color: Colors.grey[400], width: 0.3)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
              borderSide: BorderSide(color: Colors.grey[400], width: 0.3)),
          hintText: label,
          hintStyle: TextStyle(
              fontSize: 15,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500)),
    );
  }
}

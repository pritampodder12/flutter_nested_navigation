import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/index.dart';
import '../constants/index.dart';

class ScanTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return final productValid = Provider.of<ProductN>(context);
//    final loginStatus = Provider.of<LoginNotify>(context, listen: false);

    double ht = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorNames.primaryColor,
      appBar: mainAppBar(
          context: context,
          leading: userIconButton(context),
          actions: <Widget>[languageChangeIconButton(context)]),
      body: Container(
        height: ht,
        width: wid,
        child: Column(
          // Main Column
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tap to Scan Product",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: "BlissPro",
                  fontWeight: FontWeight.w700),
            ),
            Column(children: [
              Container(
                margin: EdgeInsets.only(top: 0),
                height: 150,
                width: 150,
                child: Image(
                  image: AssetImage(ImageNames.zpIcon),
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(height: 30),
              IconButton(
                  iconSize: 50,
                  onPressed: () {
                    // Navigator.of(context).pushNamed(RouterName.INVALID_TAB);
                    // productValid.invalid();
                  },
                  icon: SvgPicture.asset(
                    ImageNames.camScan,
                    color: Colors.white,
                    height: 60,
                    width: 60,
                  )),
            ]),
          ],
        ),
      ),
    );
  }
}

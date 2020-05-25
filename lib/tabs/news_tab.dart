import 'package:flutter/material.dart';

import '../widgets/index.dart';
import '../constants/index.dart';

class NewsTab extends StatefulWidget {
  @override
  _NewsTabState createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab>
    with AutomaticKeepAliveClientMixin<NewsTab> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget box({String title, String subTitle}) => Container(
        width: MediaQuery.of(context).size.width / 2.1,
        //height: MediaQuery.of(context).size.height / 4 - 60,
        height: MediaQuery.of(context).size.width / 3,
        padding: EdgeInsets.all(10),
        decoration: new BoxDecoration(
          color: const Color(0xff7c94b6),
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Color.fromRGBO(75, 115, 124, 0.3), BlendMode.dstATop),
            image: new NetworkImage(
              'http://www.allwhitebackground.com/images/2/2582-190x190.jpg',
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Color.fromRGBO(195, 213, 0, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              subTitle,
              style: TextStyle(color: Colors.white),
            )
          ],
        ));

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: mainAppBar(
            context: context,
            title: 'Latest News',
            leading: userIconButton(context),
            actions: <Widget>[languageChangeIconButton(context)]),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: ColorNames.pageBackgroundColor,
            //padding: EdgeInsets.all(10),
            child: Column(children: [
              Container(
                padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: TextField(
                  cursorColor: ColorNames.primaryColor,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30,
                        color: ColorNames.primaryColor,
                      ),
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      fillColor: Colors.blueGrey[50],
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0.0)),
                          borderSide: BorderSide(
                              color: Colors.transparent, width: 0.3)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0.0)),
                          borderSide: BorderSide(
                              color: Colors.transparent, width: 0.3)),
                      hintText: 'Search Latest News',
                      hintStyle: TextStyle(
                          fontSize: 20,
                          color: ColorNames.primaryColor,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: [
                          box(
                              title: 'Healthcare',
                              subTitle: 'The future of healthcare'),
                          box(
                              title: 'Healthcare',
                              subTitle: 'Wawming up to Myanmar and Cambodia'),
                          box(
                              title: 'Healthcare',
                              subTitle: 'Plugging healthcare gaps in Asia'),
                          box(
                              title: 'Healthcare',
                              subTitle: 'The future of healthcare'),
                          box(
                              title: 'Healthcare',
                              subTitle: 'Wawming up to Myanmar and Cambodia'),
                          box(
                              title: 'Government',
                              subTitle: 'Plugging healthcare gaps in Asia'),
                          box(
                              title: 'Healthcare',
                              subTitle: 'The future of healthcare'),
                          box(
                              title: 'Government',
                              subTitle: 'Wawming up to Myanmar and Cambodia'),
                        ],
                        //runAlignment: WrapAlignment.spaceBetween,
                        //alignment: WrapAlignment.spaceAround,
                      ),
                    ),
                  ))
            ])));
  }

  @override
  bool get wantKeepAlive => true;
}

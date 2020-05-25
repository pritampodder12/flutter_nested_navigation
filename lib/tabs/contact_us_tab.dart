import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

import '../pages/upload_photo_page.dart';
import '../widgets/index.dart';
import '../constants/index.dart';

class ContactUsTab extends StatefulWidget {
  @override
  _ContactUsTabState createState() => _ContactUsTabState();
}

class _ContactUsTabState extends State<ContactUsTab>
    with AutomaticKeepAliveClientMixin {
  String selectedItem = "";
  var selectedDropdownItem = 'Select a category';
  bool showCameraPage = false;
  Widget textInput(label, minLines, maxLines) {
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

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        appBar: mainAppBar(
            context: context,
            title: 'Contact Us',
            leading: userIconButton(context),
            actions: [languageChangeIconButton(context)]),
        body: !showCameraPage
            ? GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.grey[100],
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: CircleBorder(),
                              child: Container(
                                  width: 35,
                                  height: 35,
                                  padding: EdgeInsets.only(
                                      top: 5, right: 5, bottom: 5),
                                  child: Image(
                                      image: AssetImage(ImageNames.faqIcon))),
                              //
                            )),
                        SizedBox(height: 10),
                        textInput('Name', 1, 1),
                        SizedBox(height: 30),
                        textInput('Email', 1, 1),
                        SizedBox(height: 30),
                        textInput('How can we help ?', 5, 15),
                        SizedBox(height: 30),
                        textInput(
                            'What other medicines would you like to be available on eZTracker? ',
                            5,
                            15),
                        SizedBox(height: 30),
                        Container(
                          //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Text(
                                'Upload photo',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              // SizedBox(height:10),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                    customBorder: CircleBorder(),
                                    child: Container(
                                        width: 70,
                                        height: 70,
                                        padding: EdgeInsets.all(10),
                                        child: Image(
                                            image: AssetImage(
                                                ImageNames.camUpload))),
                                    onTap: () {
                                      setState(() {
                                        showCameraPage = true;
                                      });
                                    }),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          // height: 40,
                          // padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[50],
                              border: Border.all(
                                  width: 0.5, color: Colors.grey[200])),
                          child: SearchableDropdown.single(
                            underline: Container(
                              height: 0,
                              width: 0,
                            ),
                            selectedValueWidgetFn: (item) {
                              return Container(
                                  transform: Matrix4.translationValues(0, 0, 0),
                                  alignment: Alignment.center,
                                  child: (Text(item.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: ColorNames.primaryColor,
                                          fontWeight: FontWeight.w700))));
                            },
                            displayClearIcon: false,
                            items: <String>[
                              'QR Code',
                              'General App Enquiry',
                              'Technology',
                              'Not imported by authorized distributor',
                              'Gardasil 9 Product'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Container(
                                  child: Text(value,
                                      // textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700,
                                          color: ColorNames.primaryColor)),
                                ),
                              );
                            }).toList(),
                            value: selectedItem,
                            hint: Center(
                              child: Text(
                                "Select a catagory",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey[800]),
                              ),
                            ),
                            searchHint: Text(
                              "Select a catagory",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey[800]),
                            ),
                            onChanged: (value) {},
                            isExpanded: true,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          width: MediaQuery.of(context).size.width,
                          child: primaryButton(
                              title: 'Submit',
                              context: context,
                              onPressed: () {
                                // Navigator.of(context).pushNamed(
                                //     RouterName.CONTACT_US_SUBMISSION);
                              }),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 20),
                          child: Text(
                            'This contact from is only intended for non-medical related matters If you feel unwell or develop any symptoms following your treatment,please contact your healthcare provider directly for immediate assistance.',
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[600]),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ))))
            : UploadPhoto(
                onClose: () {
                  setState(() {
                    showCameraPage = !showCameraPage;
                  });
                },
              ));
  }

  @override
  bool get wantKeepAlive => true;
}

import 'package:flutter/material.dart';
import '../constants/index.dart';

class UploadPhoto extends StatelessWidget {
  const UploadPhoto({this.onClose});
  final Function onClose;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(30),
        color: Colors.black87,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                bottomLeft: Radius.circular(35)),
                            color: ColorNames.secondaryColor),
                        child: Icon(
                          Icons.camera_alt,
                          size: 30,
                          color: ColorNames.primaryColor,
                        ),
                      ),
                    ),
                    Container(height: 60, width: 2),
                    InkWell(
                      child: Container(
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(35),
                                bottomRight: Radius.circular(35)),
                            color: ColorNames.secondaryColor),
                        child: Icon(
                          Icons.highlight_off,
                          size: 30,
                          color: ColorNames.primaryColor,
                        ),
                      ),
                      onTap: () {
                        onClose();
                      },
                    )
                  ],
                ))
          ],
        ));
  }
}

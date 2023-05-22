import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../main.dart';

class Searchpage extends StatelessWidget {
  Searchpage({super.key});
  goMap() async {
    String googleUrl = 'https://google.com/maps/search/?api=1&query=$LAT,$LONG';
    await canLaunchUrlString(googleUrl)
        ? launchUrlString(googleUrl)
        : throw 'Couldnt launch';
  }

  // void takeImage() async {
  //   final XFile? selectedImages = await ImagePicker().pickImage(
  //     source: ImageSource.camera,
  //   );
  // }

  // final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Features'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => goMap(),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey),
                height: 200,
                width: MediaQuery.of(context).size.width * 0.46,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FeatherIcons.mapPin),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Find shoe',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              //onTap: () => takeImage(),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey),
                height: 200,
                width: MediaQuery.of(context).size.width * 0.46,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FeatherIcons.camera),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Camera',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

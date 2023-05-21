import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreenCard extends StatelessWidget {
  String title;
  String subtitle;
  double value;
  Color color;

  HomeScreenCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Theme.of(context).primaryColorLight,
        child: Container(
          height: 116,
          width: 108.35,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    //color: HexColor('#75869C'),
                    letterSpacing: -0.3,
                    fontSize: 16,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                        letterSpacing: -0.3,
                        //color: Colors.white,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      child: LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(color),
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        value: value,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

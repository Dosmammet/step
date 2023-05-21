import 'dart:ui';

import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../cards/home_screen_card.dart';
import '../constant.dart';
import '../utils/shared_preferences_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  AnimationController? animationController;
  bool isDark = false;
  var colorOfMenu = HexColor('#41B631');
  var titleOfMenu = 'Driving';
  var subtitleOfMenu = 'Working and Driving Right now';
  List animation = [];
  List title = ['Sleep', 'Off', 'On'];
  List subtitle = [
    'Get behind the wheel well-rested',
    'I am not working right now',
    'At work but not on the road at the moment'
  ];
  List colors = [HexColor('#1C293E'), HexColor('#75869C'), HexColor('#1872F6')];
  OverlayEntry? overlayEntry;
  GlobalKey globalKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: const Duration(seconds: 0), vsync: this);
    for (int i = 3; i > 0; i--) {
      animation.add(
        Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animationController!,
            curve: Interval(0.1 * i, 0.1, curve: Curves.ease),
          ),
        ),
      );
    }
  }

  _showOverLay() async {
    RenderBox? renderBox =
        globalKey.currentContext!.findRenderObject() as RenderBox?;
    Offset offset = renderBox!.localToGlobal(Offset.zero);

    OverlayState? overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: 0,
        right: 0,
        top: renderBox.size.height - 10,
        bottom: 0,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < animation.length; i++)
                ScaleTransition(
                  scale: animation[i],
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: colors[i],
                      child: Container(
                        height: 78,
                        width: 343,
                        child: ListTile(
                          onTap: () {
                            var tempColor = colorOfMenu;
                            var tempTitle = titleOfMenu;
                            var tempSubtitle = subtitleOfMenu;
                            setState(() {
                              colorOfMenu = colors[i];
                              titleOfMenu = title[i];
                              colors[i] = tempColor;
                              title[i] = tempTitle;
                              subtitle[i] = subtitleOfMenu;
                            });
                            animationController!.reverse();
                            overlayEntry!.remove();
                          },
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title[i],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 36,
                                    letterSpacing: -0.3,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: Container(
                            width: 130,
                            child: Center(
                              child: Text(
                                subtitle[i],
                                maxLines: 2,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: -0.3,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ScaleTransition(
                scale: animation[0],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: colorOfMenu,
                    child: Container(
                      height: 96,
                      width: 343,
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Current Status:',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  letterSpacing: -0.3,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                titleOfMenu,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 36,
                                  letterSpacing: -0.3,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailing: InkWell(
                          onTap: () {
                            animationController!.reverse();
                            overlayEntry!.remove();
                          },
                          child: Container(
                            height: 56,
                            width: 56,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              FeatherIcons.chevronUp,
                              color: colorOfMenu,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    animationController!.addListener(() {
      overlayState!.setState(() {});
    });
    animationController!.forward();
    overlayState!.insert(overlayEntry!);

    // await Future.delayed(const Duration(seconds: 5))
    //     .whenComplete(() => animationController!.reverse())
    //     .whenComplete(() => overlayEntry!.remove());
  }

  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Walking',
                      style: TextStyle(
                        color: HexColor('#EE324C'),
                        fontSize: 12,
                        // height: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Eco shoes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        //color: Colors.white,
                        fontWeight: FontWeight.w600,
                        //height: 24,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
                trailing: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white10,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    FeatherIcons.activity,
                    //color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              fit: StackFit.loose,
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DashedCircularProgressBar.aspectRatio(
                    aspectRatio: 1.3, // width ÷ height
                    valueNotifier: _valueNotifier,
                    progress: 43,
                    startAngle: 260,
                    sweepAngle: 200,
                    foregroundColor: HexColor('#FBCA00'),
                    backgroundColor: Config().darkAppColor,
                    foregroundStrokeWidth: 15,
                    backgroundStrokeWidth: 15,
                    animation: true,
                    seekSize: 6,
                    seekColor: Config().darkAppColor,
                    child: Center(
                      child: ValueListenableBuilder(
                        valueListenable: _valueNotifier,
                        builder: (_, double value, __) => Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.08,
                            ),
                            Text(
                              'Steps',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: -0.3,
                                fontWeight: FontWeight.w500,
                                //color: Colors.white,
                              ),
                            ),
                            Text(
                              '112',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 48,
                                letterSpacing: -0.3,
                                fontWeight: FontWeight.w700,
                                //color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  bottom: -30,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 116,
                          child: Center(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: [
                                HomeScreenCard(
                                  title: 'Calories',
                                  subtitle: '16.8',
                                  color: Colors.green,
                                  value: 0.63,
                                ),
                                HomeScreenCard(
                                  title: 'Time',
                                  subtitle: '01:56',
                                  color: Colors.red,
                                  value: 0.14,
                                ),
                                HomeScreenCard(
                                  title: 'Km',
                                  subtitle: '12.4',
                                  color: Colors.yellow,
                                  value: 0.63,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: colorOfMenu,
                child: Container(
                  height: 96,
                  width: 343,
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Current Status:',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              letterSpacing: -0.3,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Walking',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 36,
                              letterSpacing: -0.3,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: InkWell(
                      key: globalKey,
                      onTap: () {
                        _showOverLay();
                      },
                      child: Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          FeatherIcons.chevronDown,
                          color: colorOfMenu,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Card(
              color: Theme.of(context).primaryColorLight,
              //color: Config().darkAppColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                width: 343,
                height: 60,
                child: ListTile(
                  title: Text(
                    'Night Mode',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: -0.3,
                      //color: Colors.white,
                    ),
                  ),
                  trailing: CupertinoSwitch(
                    activeColor: Colors.blue,
                    trackColor: Config().darkBackgroundColor,
                    value: isDark,
                    onChanged: (value) {
                      setState(() {
                        isDark = !isDark;
                      });
                      Provider.of<ThemeProvider>(context, listen: false)
                          .swapTheme();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

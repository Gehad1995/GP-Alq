import 'package:alqgp/Src/Models/animatedWidget_model.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Widgets/animated.dart';
import 'package:alqgp/Src/controllers/animation_controller.dart';
import 'package:alqgp/Src/Utils/Consts/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/Consts/text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 3000,
            animate: TAnimatePosition(
                topBefore: 0, topAfter: 30, leftBefore: -70, leftAfter: -20),
            child: Container(
              width: tSplashContainerSize,
              height: tSplashContainerSize,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  color: tPrimaryColor.withOpacity(0.45)),
            ),
          ),
          TFadeInAnimation(
            durationInMs: 3000,
            animate: TAnimatePosition(
                bottomBefore: 0,
                bottomAfter: 30,
                rightBefore: -70,
                rightAfter: -20),
            child: Container(
              width: tSplashContainerSize,
              height: tSplashContainerSize,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  color: tPrimaryColor.withOpacity(0.45)),
            ),
          ),
          TFadeInAnimation(
            durationInMs: 3000,
            animate: TAnimatePosition(
                topBefore: 80,
                topAfter: 80,
                leftAfter: tDefaultSize,
                leftBefore: -80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tAppName, style: Theme.of(context).textTheme.headline3),
                Text(tAppTagLine, style: Theme.of(context).textTheme.headline4),
              ],
            ),
          ),
          TFadeInAnimation(
            durationInMs: 3000,
            animate: TAnimatePosition(
                bottomBefore: size.height * 0.25,
                bottomAfter: size.height * 0.4,
                leftBefore: size.width * 0.2,
                leftAfter: size.width * 0.25),
            child: Image(image: AssetImage(tLogo), width: size.width * 0.5),
          ),
          TFadeInAnimation(
              durationInMs: 3000,
              animate: TAnimatePosition(
                bottomBefore: tDefaultSpacing,
                // bottomAfter: -10,
                leftBefore: size.width * 0.39,
              ),
              child: Row(children: [
                Icon(Icons.copyright),
                Text("ALAQ 2023"),
              ]))
        ],
      ),
    );
  }
}

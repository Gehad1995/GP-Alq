import 'package:alqgp/Src/Models/animatedWidget_model.dart';
import 'package:alqgp/Src/controllers/animation_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TFadeInAnimation extends StatelessWidget {
  TFadeInAnimation({
    Key? key,
    required this.durationInMs,
    required this.child,
    this.animate,
  }) : super(key: key);
  final controller = Get.put(FadeInAnimationController());
  final int durationInMs;
  final TAnimatePosition? animate;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: durationInMs),
        top: controller.animate.value ? animate!.topAfter : animate!.topBefore,
        left:
            controller.animate.value ? animate!.leftAfter : animate!.leftBefore,
        bottom: controller.animate.value
            ? animate!.bottomAfter
            : animate!.bottomBefore,
        right: controller.animate.value
            ? animate!.rightAfter
            : animate!.rightBefore,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: durationInMs),
          opacity: controller.animate.value ? 1 : 0,
          child: child,
        ),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:social/base/base_controller.dart';
import 'package:social/router/router_name.dart';


class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
  }
}

class SplashController extends BaseController {
  CarouselController buttonCarouselController = CarouselController();
  int sliderCurrent = 0;
  List introImage = [
    "assets/image/intro1.png",
    "assets/image/intro2.png",
    "assets/image/intro3.png"
  ];
  home(){
    Get.toNamed(RouterName.home);
  }
}

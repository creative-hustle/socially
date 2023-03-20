import 'package:social/base/base_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(), fenix: true);
  }
}

class ProfileController extends BaseController {
  List imageData = [
    "assets/image/image1.png",
    "assets/image/image2.png",
    "assets/image/image3.png"
  ];
}

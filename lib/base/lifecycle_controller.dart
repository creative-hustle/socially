import 'package:get/get.dart';

class LifeCycleController extends SuperController {
  @override
  void onDetached() {
    print("/////////onDetached");
  }

  @override
  void onInactive() {
    print("/////////onInactive");
  }

  @override
  void onPaused() {
    print("/////////onPaused");
  }

  @override
  void onResumed() {
    print("/////////onResumed");
  }
}

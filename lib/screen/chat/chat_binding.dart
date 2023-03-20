import 'package:flutter/material.dart';
import 'package:social/base/base_controller.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController(), fenix: true);
  }
}

class ChatController extends BaseController {
  TextEditingController sendMsgController = TextEditingController();
  dynamic argumentData = Get.arguments;
  List textMsgList = [
    {
      "msg": "see the lions or sea lions? also, is mac there with u??",
      "author": "1",
    },
    {
      "msg": "when?",
      "author": "1",
    },
    {
      "msg": "they are doing a feed thing event at the zoo..",
      "author": "0",
    },
    {
      "msg": "we r going to c the lions",
      "author": "0",
    },




  ];
  String? userName;
  String? userImage;

  @override
  void onInit() {
    super.onInit();
    if (argumentData != null) {
      userImage = argumentData[0].toString();
      userName = argumentData[1];
    }
  }
}

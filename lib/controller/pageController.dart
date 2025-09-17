import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PassShowHide extends GetxController {
   final emailContriller = TextEditingController();
   final passwordContriller = TextEditingController();
  RxBool isHide = true.obs;

  passIsHide() {
    isHide.value = !isHide.value;
    print(isHide.value);
  }

}

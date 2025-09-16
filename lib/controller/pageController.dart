import 'package:get/get.dart';


class PassShowHide extends GetxController{
 RxBool isHide =true.obs;

 passIsHide(){
  isHide.value=isHide as bool;
  print(isHide.value);
  
 }

}
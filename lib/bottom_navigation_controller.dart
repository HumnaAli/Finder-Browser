import 'package:get/state_manager.dart';

class BottomNavigationController extends GetxController {
  var selectedindex = 1.obs;
  var textvalue = 0.obs;

  void changeIndex(int index) {
    selectedindex.value = index;
  }

  void increaseValue(){
    textvalue.value++;
  } 
}
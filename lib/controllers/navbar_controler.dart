import 'package:get/get.dart';

class NavbarController extends GetxController {
  RxInt count = 0.obs;

  itemSelect(index) {
    count.value = index;
  }
}

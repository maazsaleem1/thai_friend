import 'package:get/get.dart';
import 'package:thai_friendly_app/settingsfolder/premium_subscroption_scren.dart';

class PrivacySettingsController extends GetxController {
  var sendReadReceipts = true.obs;
  var showMyVisits = true.obs;
  var appearOffline = false.obs;
  var showMyJoinDate = true.obs;

  void handlePremiumToggle(RxBool toggle) {
    toggle.value = !toggle.value;
    if (toggle.value) {
      Get.to(() => PremiumSubscriptionScreen());
    }
  }
}

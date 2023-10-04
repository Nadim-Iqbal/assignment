import 'package:assignment/app/modules/home/controllers/offer_details_controller.dart';
import 'package:get/get.dart';

import '../controllers/offer_details_controller.dart';

class OfferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OfferDetailsController>(
          () => OfferDetailsController(),
    );
  }
}
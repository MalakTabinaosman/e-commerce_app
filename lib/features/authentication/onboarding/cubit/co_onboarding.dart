import 'package:e_commerce_app/features/authentication/login_signup/login/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoOnboarding extends GetxController {
  final PageController pageController = PageController();
  Rx<int> currentPage = 0.obs;

  void updatePageIndicator(int index) {
    currentPage.value = index;
  }

  void nextPage(dynamic currentPageIndex) {
    if (currentPageIndex.value == 2) {
      Get.offAll(LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void skipToLastPage() {
    Get.offAll(LoginScreen());
  }

  void goToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoOnboarding extends GetxController {
  final PageController pageController = PageController();
  Rx<int> currentPage = 0.obs;

  void updatePageIndicator(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void skipToLastPage() {
    pageController.jumpToPage(2);
  }

  void goToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:pml_firebase_modul/app/routes/app_pages.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  final List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      title: "Berinteraksi dengan mudah",
      body: "Kamu hanya perlu dirumah saja untuk mendapatkan teman baru",
      image: Container(
        width: Get.width * 0.6,
        height: Get.width * 0.6,
        child: Center(
          child: Lottie.asset("assets/lottie/main-laptop-duduk.json"),
        ),
      ),
    ),
    PageViewModel(
      title: "Temukan sahabat baru",
      body: "Jika kamu memang jodoh karena aplikasi ini kami sangat bahagia",
      image: Container(
        width: Get.width * 0.6,
        height: Get.width * 0.6,
        child: Center(
          child: Lottie.asset("assets/lottie/ojek.json"),
        ),
      ),
    ),
    PageViewModel(
      title: "Aplikasi bebas biaya",
      body: "Kamu tidak perlu khawatir, aplikasi ini bebas biaya apapun",
      image: Container(
        width: Get.width * 0.6,
        height: Get.width * 0.6,
        child: Center(
          child: Lottie.asset("assets/lottie/payment.json"),
        ),
      ),
    ),
    PageViewModel(
      title: "Gabung sekarang juga",
      body:
          "Daftarkan diri kamu untuk menjadi bagian dari kami. Kami akan menghubungkan dengan 1000 teman lainnya",
      image: Container(
        width: Get.width * 0.6,
        height: Get.width * 0.6,
        child: Center(
          child: Lottie.asset("assets/lottie/register.json"),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: listPagesViewModel,
        onDone: () => Get.offAllNamed(Routes.LOGIN),
        //onSkip: () {},
        showSkipButton: true,
        skip: const Text("SKIP"),
        next: const Icon(Icons.keyboard_arrow_right_outlined),
        done:
            const Text("LOGIN", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Theme.of(context).primaryColor,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}

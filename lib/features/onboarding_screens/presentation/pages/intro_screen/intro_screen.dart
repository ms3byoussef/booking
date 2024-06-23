import 'package:booking_app_algoriza/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

import '../../../../../../core/utils/AppTextStyle.dart';
import '../../../../../config/themes/app_theme.dart';
import '../../../../../core/component/constants.dart';
import '../welcome_screen/welcome_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();
    slides.add(
      Slide(
        title: appTranslation(context).intro_title_1,
        description: appTranslation(context).intro_description_1,
        pathImage: "assets/images/About-Us.png",
      ),
    );
    slides.add(
      Slide(
        title: appTranslation(context).intro_title_2,
        description: appTranslation(context).intro_description_3,
        pathImage: "assets/images/Smart appliances.png",
      ),
    );

    slides.add(
      Slide(
        title: appTranslation(context).intro_title_3,
        description: appTranslation(context).intro_description_3,
        pathImage: "assets/images/Approved.png",
      ),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = [];
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            margin: const EdgeInsets.only(bottom: 10, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(currentSlide.pathImage!),
                      fit: BoxFit.contain,
                      matchTextDirection: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Text(
                    currentSlide.title!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  margin: const EdgeInsets.only(
                    top: 15,
                    left: 20,
                    right: 20,
                  ),
                  child: Text(
                    currentSlide.description!,
                    maxLines: 3,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      backgroundColorAllSlides: AppColors.textFormFieldBackground,
      renderSkipBtn: Text(
        appTranslation(context).skip,
        style: AppTextStyle.medium.copyWith(fontSize: 18, color: Colors.black),
      ),
      renderNextBtn: Text(
        appTranslation(context).next,
        style: AppTextStyle.medium.copyWith(fontSize: 18, color: Colors.black),
      ),
      renderDoneBtn: Text(
        appTranslation(context).done,
        style: AppTextStyle.medium.copyWith(fontSize: 18, color: Colors.black),
      ),
      colorDot: AppTheme().lightTheme.primaryColor,
      sizeDot: 10,
      onSkipPress: () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const WelcomeScreen())),
      typeDotAnimation: DotSliderAnimation.SIZE_TRANSITION,
      listCustomTabs: renderListCustomTabs(),
      scrollPhysics: const BouncingScrollPhysics(),
      hideStatusBar: false,
      onDonePress: () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const WelcomeScreen())),
    );
  }
}

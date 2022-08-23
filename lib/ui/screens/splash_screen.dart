import 'package:eco_cart_ecommerce/constants/app_strings.dart';
import 'package:eco_cart_ecommerce/constants/text_styles.dart';
import 'package:eco_cart_ecommerce/ui/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash_screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToLoginScreen();
    super.initState();
  }

  goToLoginScreen() async {
    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, LoginScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppStrings.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Text(
              AppStrings.welcomeTo,
              style: boldBlackTextStyle,
            ),
            Image.asset(
              AppStrings.bigCartImage,
              width: 127,
              height: 50,
            ),
            const SizedBox(height: 17),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                AppStrings.welcomeText,
                style: greyTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Text(
              AppStrings.poweredBy,
              style: greyTextStyle,
              textAlign: TextAlign.center,
            ),
            Text(
              AppStrings.techIdara,
              style: greenSemiBoldTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

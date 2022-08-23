import 'dart:developer';

import 'package:eco_cart_ecommerce/constants/app_strings.dart';
import 'package:eco_cart_ecommerce/constants/colors.dart';
import 'package:eco_cart_ecommerce/constants/text_styles.dart';
import 'package:eco_cart_ecommerce/core/services/auth_service.dart';
import 'package:eco_cart_ecommerce/core/utils/utils.dart';
import 'package:eco_cart_ecommerce/ui/screens/checkout_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/home_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/login/login_viewmodel.dart';
import 'package:eco_cart_ecommerce/ui/screens/signup_screen.dart';
import 'package:eco_cart_ecommerce/ui/widgets/eco_button.dart';
import 'package:eco_cart_ecommerce/ui/widgets/eco_custom_row.dart';
import 'package:eco_cart_ecommerce/ui/widgets/eco_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  handleLoginBtn() async {
    log('btn pressed');
    Navigator.pushNamed(context, HomeScreen.routeName);
    log('end of ftn');
    // var data = {
    //   'email': emailController.text,
    //   'password': passwordController.text
    // };
    //
    // try {
    //   await AuthService().login(data);
    // } catch (e) {
    //   Utils.showFlushBar(context, 'Error', e.toString());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.7,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppStrings.womanShoppingImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 55.0, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.arrow_back,
                              color: Colors.white, size: 30),
                          Text(
                            'Welcome',
                            style: whiteRegularTextStyle,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 380),
                    width: MediaQuery.of(context).size.width,
                    height: 380,
                    decoration: const BoxDecoration(
                      color: AppColors.greyBackgroundColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            AppStrings.welcomeBack,
                            style: semiBoldBlackTextStyle,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            AppStrings.signIntoYourAccount,
                            style: greyRegularTextStyle,
                          ),
                          const SizedBox(height: 26),

                          ///TextFields
                          EcoTextField(
                            controller: emailController,
                            hintText: AppStrings.emailAddress,
                            labelText: AppStrings.emailAddress,
                            prefixIcon: Icon(Icons.email),
                          ),

                          const SizedBox(height: 5),
                          EcoTextField(
                            controller: passwordController,
                            hintText: AppStrings.password,
                            labelText: AppStrings.password,
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: model.isShowPassword
                                ? IconButton(
                                    icon: Icon(Icons.remove_red_eye_outlined),
                                    onPressed: model.toggleIsShowPassword,
                                  )
                                : IconButton(
                                    icon: Icon(Icons.visibility_off_outlined),
                                    onPressed: model.toggleIsShowPassword,
                                  ),
                            obscureText: model.isShowPassword,
                          ),

                          const SizedBox(height: 11),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                AppStrings.forgotPassword,
                                style: blueSmallTextStyle,
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          EcoButton(
                            onTap: handleLoginBtn,
                            text: AppStrings.login,
                          ),

                          const SizedBox(height: 15),

                          EcoCustomRow(
                            startText: AppStrings.dontHaveAnAccount,
                            endText: AppStrings.signUp,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SignUpScreen.routeName);
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

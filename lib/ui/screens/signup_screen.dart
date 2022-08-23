import 'package:eco_cart_ecommerce/constants/app_strings.dart';
import 'package:eco_cart_ecommerce/constants/colors.dart';
import 'package:eco_cart_ecommerce/constants/text_styles.dart';
import 'package:eco_cart_ecommerce/ui/widgets/eco_button.dart';
import 'package:eco_cart_ecommerce/ui/widgets/eco_custom_row.dart';
import 'package:eco_cart_ecommerce/ui/widgets/eco_textfield.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup_screen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isShowPassword = true;

  toggleIsShowPassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

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
                  image: AssetImage(AppStrings.womanShoppingImage2),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 55.0, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.arrow_back, color: Colors.white, size: 30),
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

            ///Lower Container
            Container(
              margin: const EdgeInsets.only(top: 360),
              width: MediaQuery.of(context).size.width,
              height: 430,
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
                      AppStrings.createAccount,
                      style: semiBoldBlackTextStyle,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      AppStrings.quicklyCreateAccount,
                      style: greyRegularTextStyle,
                    ),
                    const SizedBox(height: 26),

                    ///TextFields
                    EcoTextField(
                      controller: emailController,
                      hintText: AppStrings.emailAddress,
                      labelText: AppStrings.emailAddress,
                      prefixIcon: const Icon(Icons.email),
                    ),

                    const SizedBox(height: 5),
                    EcoTextField(
                      controller: phoneController,
                      hintText: AppStrings.phoneNumber,
                      labelText: AppStrings.phone,
                      prefixIcon: const Icon(Icons.phone),
                    ),

                    const SizedBox(height: 5),
                    EcoTextField(
                      controller: passwordController,
                      hintText: AppStrings.password,
                      labelText: AppStrings.password,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: isShowPassword
                          ? IconButton(
                              icon: const Icon(Icons.remove_red_eye_outlined),
                              onPressed: toggleIsShowPassword,
                            )
                          : IconButton(
                              icon: const Icon(Icons.visibility_off_outlined),
                              onPressed: toggleIsShowPassword,
                            ),
                      obscureText: isShowPassword,
                    ),

                    const SizedBox(height: 10),

                    EcoButton(
                      onTap: () {},
                      text: AppStrings.signUp,
                    ),

                    const SizedBox(height: 15),

                    EcoCustomRow(
                      startText: AppStrings.alreadyHaveAccount,
                      endText: AppStrings.logIn,
                      onTap: () {
                        Navigator.pop(context);
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
  }
}

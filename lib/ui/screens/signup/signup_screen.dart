import 'package:eco_cart_ecommerce/constants/app_strings.dart';
import 'package:eco_cart_ecommerce/constants/colors.dart';
import 'package:eco_cart_ecommerce/constants/text_styles.dart';
import 'package:eco_cart_ecommerce/core/utils/validators.dart';
import 'package:eco_cart_ecommerce/ui/screens/signup/signup_viewmodel.dart';
import 'package:eco_cart_ecommerce/ui/widgets/eco_button.dart';
import 'package:eco_cart_ecommerce/ui/widgets/eco_custom_row.dart';
import 'package:eco_cart_ecommerce/ui/widgets/eco_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return ChangeNotifierProvider<SignUpViewModel>(
      create: (_) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(
        builder: (_, model, __) => Scaffold(
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

                ///Lower Container
                Container(
                  margin: const EdgeInsets.only(top: 360),
                  width: MediaQuery.of(context).size.width,
                  // height: 430,
                  decoration: const BoxDecoration(
                    color: AppColors.greyBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Form(
                      key: _formKey,
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
                            validator: validateEmailField,
                          ),

                          const SizedBox(height: 5),
                          EcoTextField(
                            controller: phoneController,
                            hintText: AppStrings.phoneNumber,
                            labelText: AppStrings.phone,
                            prefixIcon: const Icon(Icons.phone),
                            validator: validatePhoneField,
                          ),

                          const SizedBox(height: 5),
                          EcoTextField(
                            controller: passwordController,
                            hintText: AppStrings.password,
                            labelText: AppStrings.password,
                            prefixIcon: const Icon(Icons.lock),
                            validator: validatePasswordField,
                            suffixIcon: model.isShowPassword
                                ? IconButton(
                                    icon: const Icon(
                                        Icons.remove_red_eye_outlined),
                                    onPressed: model.toggleIsShowPassword,
                                  )
                                : IconButton(
                                    icon: const Icon(
                                        Icons.visibility_off_outlined),
                                    onPressed: model.toggleIsShowPassword,
                                  ),
                            obscureText: model.isShowPassword,
                          ),

                          const SizedBox(height: 10),

                          model.isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                      color: AppColors.greenColor),
                                )
                              : EcoButton(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      model.signUp({
                                        'email': emailController.text,
                                        'password': passwordController.text,
                                        'phone': phoneController.text
                                      }, context);
                                    }
                                  },
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

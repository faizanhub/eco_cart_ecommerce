import 'package:eco_cart_ecommerce/constants/app_strings.dart';
import 'package:eco_cart_ecommerce/constants/colors.dart';
import 'package:eco_cart_ecommerce/constants/text_styles.dart';
import 'package:eco_cart_ecommerce/core/providers/cart_provider.dart';
import 'package:eco_cart_ecommerce/core/utils/validators.dart';
import 'package:eco_cart_ecommerce/ui/screens/checkout/checkout_viewmodel.dart';
import 'package:eco_cart_ecommerce/ui/widgets/eco_button.dart';
import 'package:eco_cart_ecommerce/ui/widgets/eco_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  static const String routeName = '/checkout_screen';

  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _zipCodeController.dispose();
    _cityController.dispose();
    _countryController.dispose();

    super.dispose();
  }

  handleNextButton(BuildContext context, CheckOutViewModel model) async {
    if (Form.of(context)!.validate()) {
      var cartProvider = Provider.of<CartProvider>(context, listen: false);
      List<Map<String, dynamic>> productsInCartList = [];

      for (var data in cartProvider.productList) {
        productsInCartList.add(data.toJson());
      }

      var data = {
        "name": _nameController.text.trim(),
        "email": _emailController.text.trim(),
        "phoneNumber": _phoneController.text.trim(),
        "address": _addressController.text.trim(),
        "zip": _zipCodeController.text.trim(),
        "city": _cityController.text.trim(),
        "country": _countryController.text.trim(),
        "items": productsInCartList,
      };

      model.createOrder(data, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CheckOutViewModel(),
      child: Consumer<CheckOutViewModel>(builder: (_, model, __) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: AppColors.greyBackgroundColor,
            appBar: AppBar(
              title: Text(
                AppStrings.checkOut,
                style: smallSemiBoldBlackTextStyle,
              ),
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  child: Builder(builder: (innerContext) {
                    return Column(
                      children: [
                        const SizedBox(height: 30),
                        EcoTextField(
                          controller: _nameController,
                          hintText: AppStrings.name,
                          prefixIcon: const Icon(Icons.account_circle_outlined),
                          validator: validateNormalField,
                        ),
                        const SizedBox(height: 7),
                        EcoTextField(
                          controller: _emailController,
                          hintText: AppStrings.emailAddress,
                          prefixIcon: const Icon(Icons.email_outlined),
                          validator: validateEmailField,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 5),
                        EcoTextField(
                          controller: _phoneController,
                          hintText: AppStrings.phoneNumber,
                          prefixIcon: const Icon(Icons.phone),
                          validator: validatePhoneField,
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 7),
                        EcoTextField(
                          controller: _addressController,
                          hintText: AppStrings.address,
                          prefixIcon: const Icon(Icons.place_outlined),
                          validator: validateNormalField,
                        ),
                        const SizedBox(height: 7),
                        EcoTextField(
                          controller: _zipCodeController,
                          hintText: AppStrings.zipCode,
                          prefixIcon: const Icon(Icons.keyboard_alt_outlined),
                          keyboardType: TextInputType.number,
                          validator: validateNormalField,
                        ),
                        const SizedBox(height: 7),
                        EcoTextField(
                          controller: _cityController,
                          hintText: AppStrings.city,
                          prefixIcon: const Icon(Icons.location_city),
                          validator: validateNormalField,
                        ),
                        const SizedBox(height: 7),
                        EcoTextField(
                          controller: _countryController,
                          hintText: AppStrings.country,
                          prefixIcon: const Icon(Icons.flag_outlined),
                          validator: validateNormalField,
                        ),
                        //const Spacer(),
                        const SizedBox(height: 20),
                        const SizedBox(height: 20),

                        model.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                    color: AppColors.greenColor),
                              )
                            : EcoButton(
                                onTap: () =>
                                    handleNextButton(innerContext, model),
                                text: AppStrings.next,
                              ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

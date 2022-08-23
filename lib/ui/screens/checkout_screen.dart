import 'package:eco_cart_ecommerce/constants/app_strings.dart';
import 'package:eco_cart_ecommerce/constants/colors.dart';
import 'package:eco_cart_ecommerce/constants/text_styles.dart';
import 'package:eco_cart_ecommerce/ui/screens/order_placed_screen.dart';
import 'package:eco_cart_ecommerce/ui/widgets/eco_button.dart';
import 'package:eco_cart_ecommerce/ui/widgets/eco_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final _coutryController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _zipCodeController.dispose();
    _cityController.dispose();
    _coutryController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              EcoTextField(
                controller: _nameController,
                hintText: AppStrings.name,
                prefixIcon: Icon(Icons.account_circle_outlined),
              ),
              const SizedBox(height: 5),
              EcoTextField(
                controller: _emailController,
                hintText: AppStrings.emailAddress,
                prefixIcon: Icon(Icons.email_outlined),
              ),
              const SizedBox(height: 5),
              EcoTextField(
                controller: _phoneController,
                hintText: AppStrings.phoneNumber,
                prefixIcon: Icon(Icons.phone),
              ),
              const SizedBox(height: 5),
              EcoTextField(
                controller: _addressController,
                hintText: AppStrings.address,
                prefixIcon: Icon(Icons.place_outlined),
              ),
              const SizedBox(height: 5),
              EcoTextField(
                controller: _zipCodeController,
                hintText: AppStrings.zipCode,
                prefixIcon: Icon(Icons.keyboard_alt_outlined),
              ),
              const SizedBox(height: 5),
              EcoTextField(
                controller: _cityController,
                hintText: AppStrings.city,
                prefixIcon: Icon(Icons.location_city),
              ),
              const SizedBox(height: 5),
              EcoTextField(
                controller: _coutryController,
                hintText: AppStrings.country,
                prefixIcon: Icon(Icons.flag_outlined),
              ),
              const Spacer(),
              EcoButton(
                onTap: () {
                  Navigator.pushNamed(context, OrderPlacedScreen.routeName);
                },
                text: AppStrings.next,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:eco_cart_ecommerce/constants/colors.dart';
import 'package:eco_cart_ecommerce/core/providers/cart_provider.dart';
import 'package:eco_cart_ecommerce/routes.dart';
import 'package:eco_cart_ecommerce/ui/screens/cart/cart_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/categories_detail/categories_detail_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/checkout/checkout_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/home/home_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/order_placed/order_placed_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/splash/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white.withOpacity(0.0)));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eco Cart',
        theme: ThemeData(
          primarySwatch: Colors.green,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: AppColors.blackColor,
            ),
            color: AppColors.whiteColor,
            centerTitle: true,
          ),
        ),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        // home: OrderPlacedScreen(),
      ),
    );
  }
}

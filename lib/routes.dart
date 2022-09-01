import 'package:eco_cart_ecommerce/core/models/all_categories.dart';
import 'package:eco_cart_ecommerce/ui/screens/cart/cart_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/categories_detail/categories_detail_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/checkout/checkout_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/home/home_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/login/login_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/order_placed/order_placed_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/signup/signup_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case SignUpScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case CategoriesDetailScreen.routeName:
        final args = settings.arguments as CategoriesData;
        return MaterialPageRoute(
            builder: (_) => CategoriesDetailScreen(
                  categoriesData: args,
                ));

      case CartScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CartScreen());

      case OrderPlacedScreen.routeName:
        final args = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => OrderPlacedScreen(
                  orderId: args,
                ));

      case CheckoutScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CheckoutScreen());

      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}

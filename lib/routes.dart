import 'package:eco_cart_ecommerce/ui/screens/cart_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/categories_detail_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/checkout_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/home_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/login/login_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/order_placed_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/signup_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/splash_screen.dart';
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
        return MaterialPageRoute(
            builder: (_) => const CategoriesDetailScreen());

      case CartScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CartScreen());

      case OrderPlacedScreen.routeName:
        return MaterialPageRoute(builder: (_) => const OrderPlacedScreen());

      case CheckoutScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CheckoutScreen());

      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}

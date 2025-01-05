import 'package:delivaryapp/core/widgets/custom_circle_indictoe_page.dart';
import 'package:delivaryapp/features/adressDelivery/view/add_address_page.dart';
import 'package:delivaryapp/features/adressDelivery/view/address_delivery_page.dart';
import 'package:delivaryapp/features/adressDelivery/widgets/address_items.dart';
import 'package:delivaryapp/features/cart/manger/cart_notification_provider.dart';
import 'package:delivaryapp/features/cart/manger/cart_provider.dart';
import 'package:delivaryapp/features/cart/view/cart_page.dart';
import 'package:delivaryapp/features/main/main_page.dart';
import 'package:delivaryapp/features/notifications/view/notifications_page.dart';
import 'package:delivaryapp/features/onBoarding/view/onboarding_pages.dart';
import 'package:delivaryapp/features/orderDelails/view/order_detalis_page.dart';
import 'package:delivaryapp/features/orderStatus/view/order_status_page.dart';
import 'package:delivaryapp/features/paymenets/view/add_card_page.dart';
import 'package:delivaryapp/features/paymenets/view/payments_page.dart';
import 'package:delivaryapp/features/paymenets/widgets/card_items.dart';
import 'package:delivaryapp/features/register/manger/user_provider.dart';
import 'package:delivaryapp/features/resetPassword/view/reset_password_page.dart';
import 'package:delivaryapp/features/search/view/search_page.dart';
import 'package:delivaryapp/features/stores/manger/store_provider.dart';
import 'package:delivaryapp/features/stores/view/store_details_page.dart';
import 'package:delivaryapp/features/stores/view/stores_page.dart';
import 'package:delivaryapp/features/wishList/manger/wishlist_provider.dart';
import 'package:delivaryapp/features/complateInfo/view/complateinfo_page.dart';
import 'package:delivaryapp/features/forgetPassword/view/forget_password.dart';
import 'package:delivaryapp/features/home/view/home_page.dart';
import 'package:delivaryapp/features/login/view/login_page.dart';
import 'package:delivaryapp/features/productDetalis/view/product_details_page.dart';
import 'package:delivaryapp/features/register/view/register_page.dart';
import 'package:delivaryapp/features/verification/view/verified_number.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    const DelivartApp(),
  );
}

class DelivartApp extends StatefulWidget {
  const DelivartApp({super.key});

  @override
  State<DelivartApp> createState() => _DelivartAppState();
}

class _DelivartAppState extends State<DelivartApp> {
  bool isLoged = false;
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('loged in')) {
      setState(() {
        isLoged = prefs.getBool('loged in')!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SetAddressProvider>(
          create: (context) {
            return SetAddressProvider();
          },
        ),
        ChangeNotifierProvider<CardProvider>(
          create: (context) {
            return CardProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return StoreProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return CartProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return CartNotificationProvider();
          },
        ),
        ChangeNotifierProvider<WishListProvider>(
          create: (context) {
            return WishListProvider();
          },
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) {
            return UserProvider();
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        home: const LoginPage(),
        routes: {
          OnBoardingPages.id: (context) => const OnBoardingPages(),
          MainPage.id: (context) => const MainPage(),
          ProductDetailsPage.id: (context) => const ProductDetailsPage(),
          LoginPage.id: (context) => const LoginPage(),
          RegisterPage.id: (context) => const RegisterPage(),
          ComplateInfoPage.id: (context) => const ComplateInfoPage(),
          HomePage.id: (context) => const HomePage(),
          Verfication.id: (context) => const Verfication(),
          ForgetPassword.id: (context) => const ForgetPassword(),
          SearchPage.id: (cotext) => const SearchPage(),
          NotificationsPage.id: (context) => const NotificationsPage(),
          CartPage.id: (context) => const CartPage(),
          AddressDeliveryPage.id: (context) => const AddressDeliveryPage(),
          AddAddressPage.id: (context) => const AddAddressPage(),
          PaymentsPage.id: (context) => const PaymentsPage(),
          AddCardPage.id: (context) => const AddCardPage(),
          OrderDatailsPage.id: (context) => const OrderDatailsPage(),
          OrderStatusPage.id: (context) => const OrderStatusPage(),
          StoresPage.id: (context) => const StoresPage(),
          StoreDetailsPage.id: (context) => const StoreDetailsPage(),
          CustomCircleIndictorPage.id: (context) =>
              const CustomCircleIndictorPage(),
          ResetPasswordPage.id: (context) => const ResetPasswordPage(),
        },
      ),
    );
  }
}

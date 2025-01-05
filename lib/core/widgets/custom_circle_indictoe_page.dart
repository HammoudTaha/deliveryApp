import 'package:flutter/material.dart';

class CustomCircleIndictorPage extends StatefulWidget {
  const CustomCircleIndictorPage({super.key});
  static const String id = 'circle_indictor_page';

  @override
  State<CustomCircleIndictorPage> createState() =>
      _CustomCircleIndictorPageState();
}

class _CustomCircleIndictorPageState extends State<CustomCircleIndictorPage> {
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(
          () {
            _isLoading = false;
            Navigator.pushNamed(
              context,
              ModalRoute.of(context)!.settings.arguments as String,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const SizedBox(),
    );
  }
}

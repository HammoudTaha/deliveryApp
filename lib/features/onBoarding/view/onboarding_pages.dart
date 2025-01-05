import 'package:delivaryapp/features/onBoarding/widgets/custom_onboarding_item.dart';
import 'package:delivaryapp/features/onBoarding/widgets/onboarding_items.dart';
import 'package:flutter/material.dart';

class OnBoardingPages extends StatefulWidget {
  const OnBoardingPages({super.key});
  static const String id = 'onboarding_pages';

  @override
  State<OnBoardingPages> createState() => _OnBoardingPagesState();
}

class _OnBoardingPagesState extends State<OnBoardingPages> {
  PageController controller = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: PageView.builder(
              controller: controller,
              onPageChanged: (value) {
                _currentPage = value;
                setState(() {});
              },
              itemCount: onBoardingItems.length,
              itemBuilder: (context, index) {
                return CustomOnBoardingItem(
                  image: onBoardingItems[index].image,
                  title: onBoardingItems[index].title,
                  subTitle: onBoardingItems[index].subTitle,
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 20,
              ),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  ...List.generate(
                    3,
                    (index) {
                      return index == _currentPage
                          ? AnimatedContainer(
                              duration: const Duration(),
                              height: 9,
                              width: 35,
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                color: const Color(0xff3FBFFE),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            )
                          : AnimatedContainer(
                              duration: const Duration(),
                              height: 10,
                              width: 10,
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            );
                    },
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      controller.jumpToPage(_currentPage + 1);
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

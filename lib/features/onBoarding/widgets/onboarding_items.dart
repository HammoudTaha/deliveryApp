class OnBoardingModel {
  final String title;
  final String subTitle;
  final String image;

  OnBoardingModel(
      {required this.title, required this.subTitle, required this.image});
}

List<OnBoardingModel> onBoardingItems = [
  OnBoardingModel(
    title: 'Product',
    subTitle: 'Select different products! The freedom is\n yours',
    image: 'assets/images/onBoarding/one.png',
  ),
  OnBoardingModel(
    title: 'Easy',
    subTitle: 'Pay for products! The buy safely and \n easly',
    image: 'assets/images/onBoarding/two.jpg',
  ),
  OnBoardingModel(
    title: 'Fast',
    subTitle: 'Super fast delivery! Right at your door',
    image: 'assets/images/onBoarding/three.jpg',
  )
];

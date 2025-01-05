import 'package:flutter/material.dart';

class StarsRating extends StatelessWidget {
  const StarsRating({super.key, required this.rating});
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          rating <= 0
              ? Icons.star_border
              : rating > 0 && rating < .5
                  ? Icons.star_half
                  : Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        Icon(
          rating <= 1
              ? Icons.star_border
              : rating > 1 && rating < 1.5
                  ? Icons.star_half
                  : Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        Icon(
          rating <= 2
              ? Icons.star_border
              : rating > 2 && rating < 2.5
                  ? Icons.star_half
                  : Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        Icon(
          rating <= 3
              ? Icons.star_border
              : rating > 3 && rating < 3.5
                  ? Icons.star_half
                  : Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        Icon(
          rating <= 4
              ? Icons.star_border
              : rating > 4 && rating < 4.5
                  ? Icons.star_half
                  : Icons.star,
          color: Colors.amber,
          size: 18,
        ),
      ],
    );
  }
}

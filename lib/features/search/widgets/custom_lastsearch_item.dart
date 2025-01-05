import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomLastSearchItem extends StatelessWidget {
  const CustomLastSearchItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          child: const Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Icon(
                FontAwesomeIcons.clock,
                size: 16,
                color: Colors.black38,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Search name...........',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              //const Spacer(),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.close,
            size: 20,
            color: Colors.black38,
          ),
        )
      ],
    );
  }
}

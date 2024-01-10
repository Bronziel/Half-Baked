import 'package:fb2/Redesign/RecipePages/Recipe/first_row_widget.dart';
import 'package:flutter/material.dart';

class PortionsizedStackWidget extends StatelessWidget {
  const PortionsizedStackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 290,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffd9d9d9),
          ),
        ),
        const Positioned(
          top: 10,
          left: 7.2,
          child: PortionsizeIconTile(),
        ),
        const Positioned(
          top: 10,
          left: 56, // Position your text or add alignment as needed
          child: Text(
            "Portionsize:",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Positioned(
          top: 10,
          left: 206,
          child: Text(
            "12",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Positioned(
          top: 10,
          left: 243,
          child: ManIconTile(),
        ),
        // Include your other Containers within the Stack
        // Make sure to position them or size them as needed
      ],
    );
  }
}

class TimeStack extends StatelessWidget {
  final String title;
  final String time;
  final double titleLeftPosition;
  final double timeLeftPosition;

  const TimeStack({
    super.key,
    required this.title,
    required this.time,
    this.titleLeftPosition = 44, // Default value if not provided
    this.timeLeftPosition = 178, // Default value if not provided
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 290,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffd9d9d9),
          ),
        ),
        const Positioned(
          top: 10,
          left: 9,
          child:
              ClockIconTile(), // Assuming this is a custom widget for the clock icon
        ),
        Positioned(
          top: 10,
          left: titleLeftPosition,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: timeLeftPosition,
          child: Text(
            time,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Positioned(
          top: 10,
          left: 230,
          child: Text(
            "min",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class PortionsizeIconTile extends StatelessWidget {
  const PortionsizeIconTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/new/icons/portion.png',
      width: 44,
      height: 30,
    );
  }
}

class ManIconTile extends StatelessWidget {
  const ManIconTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/new/icons/man.png',
      width: 11.75,
      height: 30,
    );
  }
}

class ClockIconTile extends StatelessWidget {
  const ClockIconTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/new/icons/clock.png',
      width: 30,
      height: 30,
    );
  }
}

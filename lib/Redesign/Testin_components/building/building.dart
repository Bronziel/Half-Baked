import 'package:flutter/material.dart';

class Building extends StatelessWidget {
  const Building({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(),
    );
  }
}

class Containerkals extends StatelessWidget {
  const Containerkals({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 585,
      height: 255,
      decoration: const BoxDecoration(
        color: Color(0xFFF13030),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(children: [
        const SizedBox(
          height: 45,
        ),
        Row(
          children: [
            const SizedBox(
              width: 45,
            ),
            Container(
              width: 40,
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(
                color: const Color(0xff234234),
                width: 1,
              )),
              child: Image.asset(
                'images/kals/fire.png',
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ]),
    );
  }
}

class CaloriecardStackedWidget extends StatelessWidget {
  const CaloriecardStackedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 255,
      width: 585,
      child: Card(
        color: Color(0xFFF13030),
      ),
    );
  }
}

class CalorieCardWidget extends StatelessWidget {
  const CalorieCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 585,
      height: 255,
      child: Card(
        color: const Color(0xFFF13030),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.green)),
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.green)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 45,
                    ),
                    Image.asset('images/kals/fire.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Calories',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    const SizedBox(
                      width: 211,
                    ),
                    Image.asset('images/kals/cheked.png'),
                  ],
                ),
              ),
              const Row(),
              const Row(),
            ],
          ),
        ),
      ),
    );
  }
}

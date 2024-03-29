import 'package:flutter/material.dart';
import '../components/styles/colors.dart';
import '../components/styles/textstyle.dart';
import 'svg_assets.dart';

class NewAppbar extends StatelessWidget {
  const NewAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Paint.mainncolor(),
      toolbarHeight: 90,
      centerTitle: true,
      title: const Text('HalfBaked',
          style: TextStyle(
            color: Colors.white,
            fontFamily: FontFamily.bigTitle,
            fontSize: Fontsize.bigfont,
          )),
      actions: const [
        BestickSvgIcon(),
        SizedBox(
          width: 780,
        )
      ],
    );
  }
}

class MyAppBarTitle extends StatelessWidget {
  const MyAppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Row(
        children: [
          Text('HalfBaked',
              style: TextStyle(
                color: Colors.white,
                fontFamily: FontFamily.bigTitle,
                fontSize: Fontsize.bigfont,
              )),
          SizedBox(
            width: 20,
          ),
          BestickSvgIcon(),
        ],
      ),
    );
  }
}

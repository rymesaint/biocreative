import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: SvgPicture.asset('assets/images/undraw_access_denied.svg'),
      ),
    );
  }
}

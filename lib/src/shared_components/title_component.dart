import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleComponent extends StatelessWidget {
  final String title;
  final String? description;
  const TitleComponent({Key? key, required this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Visibility(
          visible: description != null,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                description.toString(),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

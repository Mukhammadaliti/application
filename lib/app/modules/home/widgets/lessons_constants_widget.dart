import 'package:flutter/material.dart';

class LessonsConstansWidget extends StatelessWidget {
  const LessonsConstansWidget({
    super.key,
    this.ontap,
    this.lessonText,
    this.images,
  });
  final Function()? ontap;
  final String? lessonText;
  final String? images;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Image.asset(images!),
          Positioned(
              // height: 1,
              bottom: 27,
              // left: 103,
              child: Text(
                lessonText!.toUpperCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Gentium',
                    fontSize: 32,
                    color: Colors.white),
              ))
        ]),
      ),
    );
  }
}

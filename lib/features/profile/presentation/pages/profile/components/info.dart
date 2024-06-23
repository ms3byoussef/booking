// ignore_for_file: unused_local_variable

import 'package:booking_app_algoriza/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({
    Key? key,
    this.name,
    this.email,
    this.image,
  }) : super(key: key);
  final String? name, email, image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 280, // 240
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: 200, //150
              color: Theme.of(context).primaryColor,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                  ), //10
                  height: 120, //140
                  width: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.card,
                        width: 1, //8
                      ),
                      image: DecorationImage(
                          image: NetworkImage(
                            image!,
                          ),
                          fit: BoxFit.contain)),
                ),
                Text(
                  name!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 5), //5
                Text(
                  email!,
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

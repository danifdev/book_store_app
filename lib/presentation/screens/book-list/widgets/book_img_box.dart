import 'dart:math';

import 'package:books/shared/helpers.dart';
import 'package:flutter/material.dart';

class BookImgBox extends StatelessWidget {
  const BookImgBox({
    Key? key,
    required this.constraints,
    required this.imgPath,
    required this.random,
  }) : super(key: key);
  final BoxConstraints constraints;
  final String imgPath;
  final Random random;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight / 2,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: constraints.maxHeight / 2.5,
            decoration: BoxDecoration(
                color: boxColors[random.nextInt(7)],
                borderRadius: BorderRadius.circular(12)),
          ),
          Positioned(
            top: 0,
            child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    height: constraints.maxHeight / 2,
                    width: constraints.maxWidth / 2,
                    image: NetworkImage(
                      imgPath,
                    ),
                    fit: BoxFit.fill, // use this
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: boxColors[random.nextInt(2)],
                      );
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

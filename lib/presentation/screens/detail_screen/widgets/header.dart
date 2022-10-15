import 'package:books/shared/constants.dart';
import 'package:flutter/material.dart';

class DetailScreenHeader extends StatelessWidget {
  const DetailScreenHeader(
      {Key? key, required this.height, this.boxColor, this.imgPath})
      : super(key: key);
  final double height;
  final Color? boxColor;
  final String? imgPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 350,
      child: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: height * 200,
            decoration: BoxDecoration(
              color: boxColor ?? const Color(0xffF9CFE3),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: height * 250,
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Hero(
                  tag: 'location-img-$imgPath',
                  child: Image(
                    image: NetworkImage(
                      imgPath ?? errorLink,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 16,
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(side: const BorderSide(width: 1)),
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.black,
              ),
              label: const Text(
                "",
              ),
            ),
          )
        ],
      ),
    );
  }
}

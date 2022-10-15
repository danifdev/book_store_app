import 'package:books/app/constants/constants.dart';
import 'package:flutter/material.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({
    Key? key,
    this.title,
    this.authors,
    required this.constraints,
    required this.pageCount,
  }) : super(key: key);
  final String? title;
  final List<String>? authors;
  final BoxConstraints constraints;
  final String pageCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            authors?.isNotEmpty == true ? (authors?[0] ?? '-') : "Not Found",
            maxLines: 1,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontSize: constraints.maxWidth * 0.09,
                ),
          ),
          Text(
            title ?? '-',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                fontSize: constraints.maxWidth * 0.09,
                fontWeight: FontWeight.bold),
          ),
          Container(
            height: constraints.maxHeight * 0.13,
            width: constraints.maxWidth * 0.35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(12)),
            child: Text(
              '\$$pageCount',
              style: TextStyle(
                  fontSize: constraints.maxWidth * 0.08, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

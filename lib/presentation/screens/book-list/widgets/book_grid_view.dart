import 'dart:math';
import 'package:books/shared/constants.dart';
import 'package:books/core/models/books/items.model.dart';
import 'package:books/presentation/screens/book-list/widgets/book_img_box.dart';
import 'package:books/presentation/screens/book-list/widgets/book_info.dart';
import 'package:books/presentation/screens/detail_screen/detail_screen.dart';
import 'package:flutter/material.dart';

class BookGridView extends StatelessWidget {
  const BookGridView({Key? key, this.items, required this.random, required this.controller})
      : super(key: key);
  final List<Items>? items;
  final Random random;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      itemCount: items?.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 260,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      itemBuilder: (context, index) {
        final item = items?[index];
        final imgPath = item?.volumeInfo?.imageLinks?.thumbnail;
        final id = item?.id;
        final authors = item?.volumeInfo?.authors;
        final pageCount = item?.volumeInfo?.pageCount;
        final title = item?.volumeInfo?.title;
        return Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    id: id,
                    boxColor: boxColors[random.nextInt(7)],
                  ),
                ),
              );
            },
            child: Container(
              height: 250,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BookImgBox(
                      constraints: constraints,
                      imgPath: imgPath ?? '',
                      random: random,
                    ),
                    BookInfo(
                      constraints: constraints,
                      pageCount: pageCount.toString(),
                      authors: authors,
                      title: title,
                    )
                  ],
                );
              }),
            ),
          ),
        );
      },
    );
  }
}

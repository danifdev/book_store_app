import 'package:books/core/models/books/books.dart';
import 'package:books/core/service/service.dart';
import 'package:books/presentation/screens/detail_screen/detail_screen.dart';
import 'package:flutter/material.dart';
import '../../../../app/constants/constants.dart';

class PopularBooks extends StatelessWidget {
  const PopularBooks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Books>(
      future: AppService.getPopularBooks(),
      builder: (context, snapshot) {
        final books = snapshot.hasData ? snapshot.data : null;
        return LayoutBuilder(builder: (context, constraints) {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: books?.totalItems,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final categories = books?.items?[index].volumeInfo?.categories;
              final imgPath =
                  books?.items?[index].volumeInfo?.imageLinks?.thumbnail;
              final authors = books?.items?[index].volumeInfo?.authors;
              final title = books?.items?[index].volumeInfo?.title;
              final pageCount = books?.items?[index].volumeInfo?.pageCount;
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        id: books?.items?[index].id,
                      ),
                    ),
                  );
                },
                child: Container(
                  //width: width / 1.5,
                  width: constraints.maxWidth * 0.8,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Card(
                            elevation: 2,
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Container(
                              //height: height * 0.18,
                              // width: 100,
                              height: constraints.maxHeight,
                              width: constraints.maxWidth * 0.30,

                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image(
                                  image: NetworkImage(
                                    imgPath ?? '',
                                  ),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return SizedBox();
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: constraints.maxWidth * 0.03),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              authors?.isNotEmpty == true
                                  ? (authors?[0] ?? '-')
                                  : "Censored",
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                    fontSize: constraints.maxWidth * 0.038,
                                  ),
                            ),
                            Text(
                              title ?? '-',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(
                                    fontSize: constraints.maxWidth * 0.048,
                                  ),
                            ),
                            Text(
                              categories?.isNotEmpty == true
                                  ? (categories?[0] ?? '')
                                  : "Unknown",
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                    fontSize: constraints.maxWidth * 0.038,
                                  ),
                            ),
                            const Spacer(),
                            Container(
                              height: constraints.maxHeight * 0.2,
                              width: constraints.maxWidth * 0.18,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColors.black,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                '${pageCount ?? '-'}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            const Spacer(
                              flex: 2,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        });
      },
    );
  }
}

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.black,
      ),
    );
  }
}

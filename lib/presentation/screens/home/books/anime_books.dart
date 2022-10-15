import 'package:books/core/service/service.dart';
import 'package:books/presentation/screens/home/books/popular_books.dart';
import 'package:flutter/material.dart';
import '../../../../shared/helpers.dart';
import '../../../../core/models/books/books.dart';
import '../../detail_screen/detail_screen.dart';

class AnimeBooks extends StatefulWidget {
  const AnimeBooks({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimeBooks> createState() => _AnimeBooksState();
}

class _AnimeBooksState extends State<AnimeBooks> {
  late Future<Books> fetchAnimeBooks;

  @override
  void initState() {
    fetchAnimeBooks = AppService.getAnimeBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Books>(
        future: fetchAnimeBooks,
        builder: (context, AsyncSnapshot<Books> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Opps! Try again later!"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AppLoadingWidget();
          }
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return LayoutBuilder(builder: (context, constraints) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data?.items?.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                  id: snapshot.data?.items?[index].id)));
                    },
                    child: Container(
                      width: constraints.maxWidth * 0.30,
                      padding:
                          const EdgeInsets.only(left: 16, bottom: 5, top: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 2,
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Container(
                              //height: height * 0.18,
                              height: constraints.maxHeight * 0.6,
                              width: constraints.maxWidth * 0.25,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image(
                                  image: NetworkImage(
                                    "${snapshot.data?.items?[index].volumeInfo?.imageLinks?.thumbnail ?? errorLink}",
                                  ),
                                  errorBuilder: (_, s, m) {
                                    return const SizedBox();
                                  },
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "${snapshot.data?.items?[index].volumeInfo?.title}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                                    fontSize: constraints.maxWidth * 0.035,
                                    fontWeight: FontWeight.w500),
                          ),
                          Container(
                            height: constraints.maxHeight * 0.1,
                            width: constraints.maxWidth * 0.18,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              "\$${snapshot.data?.items?[index].volumeInfo?.pageCount}",
                              style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.035,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            });
          }
          return const SizedBox();
        });
  }
}

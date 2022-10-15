import 'package:books/presentation/screens/home/widgets/header.dart';
import 'package:books/presentation/screens/home/books/adventure_books.dart';
import 'package:flutter/material.dart';
import 'books/anime_books.dart';
import '../../widgets/headline.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Theme.of(context).,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(
              height: height,
            ),
            Headline(
              category: "Anime",
              showAll: "Anime",
            ),
            SizedBox(
              height: height / 3.4,
              child: const AnimeBooks(),
            ),
            Headline(
              category: "Action & Adventure",
              showAll: "Action & Adventure",
            ),
            SizedBox(
              height: height / 3.4,
              child: const AdventureBooks(),
            ),
          ],
        ),
      ),
    );
  }
}

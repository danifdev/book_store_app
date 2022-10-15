import 'package:books/core/service/service.dart';
import 'package:books/presentation/widgets/app_error_widget.dart';
import 'package:books/presentation/screens/home/books/popular_books.dart';
import 'package:flutter/material.dart';
import '../../shared/helpers.dart';
import '../../core/models/books/books.dart';
import 'detail_screen/detail_screen.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<Books>(
      future: AppService().searchBooks(searchBook: query),
      builder: (context, AsyncSnapshot<Books> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppLoadingWidget();
        } else if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: snapshot.data?.items?.length,
            itemBuilder: (context, index) {
              final item = snapshot.data?.items?[index].volumeInfo;
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        id: snapshot.data?.items?[index].id,
                        boxColor: AppColors.lightBlue,
                      ),
                    ),
                  );
                },
                leading: Image.network(
                  item?.imageLinks?.thumbnail ?? errorLink,
                ),
                title: Text(
                  item?.authors?.isNotEmpty == true
                      ? (item?.authors?[0] ?? '-')
                      : "Not Found",
                ),
                subtitle: Text(
                  item?.title ?? '-',
                ),
              );
            },
          );
        } else {
          return const AppErrorWidget();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: AppService().searchBooks(
        searchBook: query.isEmpty == true ? 'Biography' : query,
      ),
      builder: (context, AsyncSnapshot<Books> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppLoadingWidget();
        } else if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              final item = snapshot.data?.items?[index].volumeInfo;
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        id: snapshot.data?.items?[index].id,
                        boxColor: AppColors.lightBlue,
                      ),
                    ),
                  );
                },
                leading:
                    Image.network(item?.imageLinks?.thumbnail ?? errorLink),
                title: Text(
                  item?.authors?.isNotEmpty == true
                      ? (item?.authors?[0] ?? '-')
                      : "Not Found",
                ),
                subtitle: Text(item?.title ?? '-'),
              );
            },
          );
        } else {
          return const AppErrorWidget();
        }
      },
    );
  }
}

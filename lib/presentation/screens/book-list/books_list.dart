import 'package:books/shared/helpers.dart';
import 'package:books/core/service/service.dart';
import 'package:books/presentation/widgets/app_error_widget.dart';
import 'package:books/presentation/screens/home/books/popular_books.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../core/models/books/books.dart';
import 'widgets/book_grid_view.dart';

class BookList extends StatefulWidget {
  BookList({Key? key, required this.name}) : super(key: key);

  String name;

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  final _random = math.Random();

  final keyRefresh = GlobalKey<RefreshIndicatorState>();

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => keyRefresh.currentState?.show());
  }

  Future _refresh() async {
    await AppService().searchBooks(searchBook: widget.name);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 1,
        // backgroundColor: Colors.white,
        // iconTheme: IconThemeData(color: AppColors.black),
        title: Text(
          widget.name,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: FutureBuilder<Books>(
        future: AppService().searchBooks(searchBook: widget.name),
        builder: (context, AsyncSnapshot<Books> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AppLoadingWidget();
          } else if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return RefreshIndicator(
              key: keyRefresh,
              backgroundColor: AppColors.black,
              color: AppColors.lightBlue,
              strokeWidth: 2,
              edgeOffset: 6,
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              onRefresh: () => _refresh(),
              child: BookGridView(
                controller: _scrollController,
                random: _random,
                items: snapshot.data?.items,
              ),
            );
          } else {
            return const AppErrorWidget();
          }
        },
      ),
    );
  }
}

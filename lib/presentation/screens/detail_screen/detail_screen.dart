import 'package:books/core/models/detail.model.dart';
import 'package:books/core/service/service.dart';
import 'package:books/presentation/screens/detail_screen/widgets/detail_response.dart';
import 'package:books/presentation/widgets/app_error_widget.dart';
import 'package:books/presentation/screens/home/books/popular_books.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key, required this.id, this.boxColor}) : super(key: key);

  var id;
  final Color? boxColor;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 815;
    double width = MediaQuery.of(context).size.width / 375;

    return Scaffold(
      body: id != null
          ? FutureBuilder<DetailModel>(
              future: AppService().showBooksDetails(id: id),
              builder: (context, AsyncSnapshot<DetailModel> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const AppLoadingWidget();
                } else if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  final item = snapshot.data?.volumeInfo;
                  final title = snapshot.data?.volumeInfo?.title;
                  final printType = item?.printType;
                  final authors = item?.authors;
                  return BookDetailResponse(
                    height: height,
                    boxColor: boxColor,
                    printType: printType ?? '-',
                    title: title ?? '-',
                    width: width,
                    authors: authors,
                    volumeInfo: item,
                  );
                } else {
                  return const AppErrorWidget();
                }
              },
            )
          : const AppErrorWidget(),
    );
  }
}

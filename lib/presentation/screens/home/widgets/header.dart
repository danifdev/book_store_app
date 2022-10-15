import 'dart:developer';

import 'package:books/app/constants/constants.dart';
import 'package:books/core/bloc/app_bloc.dart';
import 'package:books/presentation/screens/home/widgets/serach_box.dart';
import 'package:books/presentation/screens/search_screen.dart';
import 'package:books/presentation/theme/theme.dart';
import 'package:books/presentation/screens/home/books/popular_books.dart';
import 'package:books/presentation/widgets/headline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height / 2,
      child: Stack(
        children: [
          Container(
            height: height / 2.5,
            decoration: BoxDecoration(
              // color: AppColors.lightBlue,
              color: Theme.of(context).backgroundColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
            ),
            child: SafeArea(
              minimum: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Book Store",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      BlocBuilder<AppBloc, AppState>(
                        builder: (context, state) {
                          return IconButton(
                            onPressed: () async {
                              if (state.appThemeType == AppThemeType.light) {
                                await context
                                    .read<AppBloc>()
                                    .toSetTheme(AppThemeType.dark);
                              } else if (state.appThemeType ==
                                  AppThemeType.dark) {
                                await context
                                    .read<AppBloc>()
                                    .toSetTheme(AppThemeType.light);
                              }
                            },
                            icon: Icon(
                              state.appThemeType == AppThemeType.dark
                                  ? Icons.dark_mode
                                  : Icons.light_mode,
                              color: Theme.of(context).shadowColor,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const Spacer(),
                  SearchBox(onSearch: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(),
                    );
                  }),
                  const Spacer(flex: 2),
                  Headline(
                    category: 'Most Popular',
                    showAll: 'Fiction',
                  ),
                  const Spacer(flex: 5),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: height / 5.3,
              margin: const EdgeInsets.only(left: 16),
              child: const PopularBooks(),
            ),
          ),
        ],
      ),
    );
  }
}

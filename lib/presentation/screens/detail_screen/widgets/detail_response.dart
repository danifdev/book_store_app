import 'package:books/app/constants/constants.dart';
import 'package:books/core/models/books/volume-info.model.dart' as v;
import 'package:books/presentation/screens/detail_screen/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailResponse extends StatelessWidget {
  const BookDetailResponse(
      {Key? key,
      required this.height,
      required this.title,
      this.authors,
      required this.printType,
      required this.width,
      this.volumeInfo,
      this.boxColor})
      : super(key: key);
  final double height;
  final double width;
  final String title;
  final Color? boxColor;
  final String printType;
  final v.VolumeInfo? volumeInfo;
  final List<String>? authors;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DetailScreenHeader(
            height: height,
            boxColor: boxColor,
            imgPath: volumeInfo?.imageLinks?.thumbnail,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontSize: 24),
                ),
                const SizedBox(height: 10),
                Text(
                  authors?.isNotEmpty == true
                      ? (authors?[0] ?? '-')
                      : "Censored".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        printType,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      Container(
                        height: height * 35,
                        width: width * 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          "\$${volumeInfo?.pageCount}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${volumeInfo?.pageCount} Pages",
                        style: Theme.of(context).textTheme.headline4,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () async {
                        Uri url = Uri.parse("${volumeInfo?.previewLink}");

                        if (await canLaunchUrl(url)) {
                          await launchUrl(url,
                              mode: LaunchMode.externalApplication);
                        } else {
                          throw 'could not launch $url';
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 1, color: Theme.of(context).shadowColor),
                      ),
                      child: Text(
                        "VIEW ONLINE",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          width: 1,
                          color: Theme.of(context).shadowColor,
                        ),
                      ),
                      icon: Icon(
                        Icons.favorite_outline,
                        color: Theme.of(context).shadowColor,
                      ),
                      label: Text(
                        "WISHLIST",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Details",
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Author",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Text("Publisher",
                              style: Theme.of(context).textTheme.headline4),
                          Text("Published Date",
                              style: Theme.of(context).textTheme.headline4),
                          Text("Categories",
                              style: Theme.of(context).textTheme.headline4)
                        ],
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${volumeInfo?.authors?[0]}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(fontSize: 16),
                            ),
                            Text(
                              "${volumeInfo?.publisher}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(fontSize: 16),
                            ),
                            Text(
                              "${volumeInfo?.publishedDate}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(fontSize: 16),
                            ),
                            Text(
                              "${volumeInfo?.categories?[0]}",
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(fontSize: 16),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Discription",
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  height: 10,
                ),
                ReadMoreText(
                  "${volumeInfo?.description}",
                  trimLines: 6,
                  colorClickableText: AppColors.black,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '...Read More',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontSize: 14),
                  trimExpandedText: ' Less',
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    Uri url = Uri.parse("${volumeInfo?.infoLink}");

                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'could not launch $url';
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                    backgroundColor: AppColors.black,
                  ),
                  child: Text(
                    "Buy",
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

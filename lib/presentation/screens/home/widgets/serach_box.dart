import 'package:books/shared/helpers.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key, required this.onSearch}) : super(key: key);
  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSearch,
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 50,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: Theme.of(context).shadowColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Search for Books"),
            Icon(
              Icons.search,
              color: Theme.of(context).shadowColor,
            ),
          ],
        ),
      ),
    );
  }
}

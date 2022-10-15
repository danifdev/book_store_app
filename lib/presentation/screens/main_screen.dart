import 'package:books/app/constants/constants.dart';
import 'package:books/presentation/screens/category/categories.dart';
import 'package:books/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final screens = const [
    HomeScreen(),
    Categories(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: NavItem(
              iconData: Icons.home,
              isSelected: _currentIndex == 0,
              title: 'Home',
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: NavItem(
              isSelected: _currentIndex == 1,
              title: 'Categories',
              iconData: Icons.category,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem(
      {Key? key,
      required this.isSelected,
      required this.title,
      required this.iconData})
      : super(key: key);
  final bool isSelected;
  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: isSelected ? 8 : 0,
          horizontal: isSelected ? 12 : 0,
        ),
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).bottomAppBarColor,
              )
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
            ),
            AnimatedCrossFade(
              secondChild: const SizedBox(),
              duration: const Duration(
                seconds: 1,
              ),
              firstCurve: Curves.decelerate,
              secondCurve: Curves.linear,
              crossFadeState: isSelected
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: Container(
                margin: const EdgeInsets.only(left: 8),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: AppColors.black,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

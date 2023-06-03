import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/const_colors.dart';
import '../../../constants/const_widgets.dart';
import 'screens/add_screen.dart';
import 'screens/favourite_screen.dart';
import 'screens/main_screen.dart';
import 'screens/message_screen.dart';
import 'screens/profile_screen.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  var screensList = [
    const MainScreen(),
    const FavouriteScreen(),
    const AddScreen(),
    const MessageScreen(),
    const ProfileScreen(),
  ];

  void onTap(int menuIndex) {
    setState(() {
      index = menuIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screensList[index],
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 56,
          padding: const EdgeInsets.all(6),
          margin: const EdgeInsets.symmetric(horizontal: 44, vertical: 8),
          decoration: BoxDecoration(
            color: ConstColors.gray900,
            borderRadius: ConstWidgets.borderRadius,
          ),
          child: Row(
            children: [
              MenuItem(
                iconPath: 'assets/img/home/navbar/home.svg',
                isSelected: index == 0,
                onTap: () {
                  onTap(0);
                },
              ),
              MenuItem(
                iconPath: 'assets/img/home/navbar/heart.svg',
                isSelected: index == 1,
                onTap: () {
                  onTap(1);
                },
              ),
              MenuItem(
                iconPath: 'assets/img/home/navbar/add.svg',
                isSelected: index == 2,
                onTap: () {
                  onTap(2);
                },
              ),
              MenuItem(
                iconPath: 'assets/img/home/navbar/message.svg',
                isSelected: index == 3,
                onTap: () {
                  onTap(3);
                },
              ),
              MenuItem(
                iconPath: 'assets/img/home/navbar/user.svg',
                isSelected: index == 4,
                onTap: () {
                  onTap(4);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
  });

  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : null,
            borderRadius: ConstWidgets.borderRadius,
          ),
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              colorFilter: isSelected
                  ? const ColorFilter.mode(ConstColors.gray900, BlendMode.srcIn)
                  : null,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/constants/app_colors.dart';
import 'package:todo/core/constants/assets.dart';
import 'package:todo/core/extensions/color_extension.dart';
import 'package:todo/core/extensions/num_extension.dart';
import 'package:todo/core/widgets/w_container.dart';
import 'package:todo/core/widgets/w_scale_animation.dart';
import 'package:todo/feature/calendar/views/calendar_screen.dart';
import 'package:todo/feature/focuce/views/focuse_screen.dart';
import 'package:todo/feature/home/home_screen.dart';
import 'package:todo/feature/profile/views/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 4;

  final List<Widget> _screens = const [
    HomeScreen(),
    CalendarScreen(),
    AddTaskScreen(),
    FocuseScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AddTaskScreen()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      floatingActionButton: WScaleAnimationWidget(
        onTap: () {},
        child: WContainer(
          borderRadius: BorderRadius.circular(50),
          width: 64.w,
          height: 64.w,
          child: Icon(Icons.add, color: AppColors.surface),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF2C2C2E),
        notchMargin: 0,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                label: 'Index',
                index: 0,
                iconPath: Assets.homeIcon,
                iconPathFilled: Assets.homeIconFilled,
              ),
              _buildNavItem(
                label: 'Calendar',
                index: 1,
                iconPath: Assets.calendarIcon,
                iconPathFilled: Assets.calendarIconFilled,
              ),
              const SizedBox(width: 40), // space for FAB
              _buildNavItem(
                label: 'Focuse',
                index: 3,
                iconPath: Assets.focuseIcon,
                iconPathFilled: Assets.focuseIconFilled,
              ),
              _buildNavItem(
                label: 'Profile',
                index: 4,
                iconPath: Assets.profileIcon,
                iconPathFilled: Assets.profileIconFilled,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String iconPath,
    required String iconPathFilled,
    required String label,
    required int index,
  }) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(isSelected ? iconPathFilled : iconPath),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacityNew(isSelected ? 1 : 0.5),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [Text("Salm")]));
  }
}

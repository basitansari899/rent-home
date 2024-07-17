
import 'package:flutter/material.dart';
import 'package:home_task/src/modules/favorites/favorite_screen.dart';
import 'package:home_task/src/modules/home/home_screen.dart';
import 'package:home_task/src/modules/map/map_screen.dart';
import 'package:home_task/src/modules/messages/message_screen.dart';
import 'package:home_task/src/modules/profile/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _bottomAnimation;
  int _selectedIndex = 2;

  final List<Widget> _screens = [
    const MapSearchScreen(),
    const MessageScreen(),
    const ProductHome(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
     _bottomAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _screens[_selectedIndex],
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:30.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: const Offset(0, 0),
            ).animate(_bottomAnimation),
                child: FadeTransition(
                opacity: _bottomAnimation,
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildNavItem(index: 0, icon: Icons.search,context: context),
                        _buildNavItem(index: 1, icon: Icons.message,context: context),
                        _buildNavItem(index: 2, icon: Icons.home,context: context),
                        _buildNavItem(index: 3, icon: Icons.favorite,context: context),
                        _buildNavItem(index: 4, icon: Icons.person,context: context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({required int index, required IconData icon, required BuildContext context}) {
    bool isSelected = index == _selectedIndex;
    return GestureDetector(
      onTap: () => _onNavItemTapped(index),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.orange : Colors.black,
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.7),
        ),
      ),
    );
  }
}




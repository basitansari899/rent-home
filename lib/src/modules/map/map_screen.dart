
import 'package:flutter/material.dart';
import 'package:home_task/src/modules/map/widgets/circular_button.dart';
import 'package:home_task/src/modules/map/widgets/indicator_icon.dart';
import 'package:home_task/src/modules/map/widgets/popup_menu.dart';
import 'package:home_task/src/modules/map/widgets/rounded_rect_widget.dart';
import 'package:home_task/src/models/indicator_model.dart';

class MapSearchScreen extends StatefulWidget {
  const MapSearchScreen({super.key});

  @override
  _AnimatedIndicatorsScreenState createState() =>
      _AnimatedIndicatorsScreenState();
}

class _AnimatedIndicatorsScreenState extends State<MapSearchScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _textFieldAnimation;
  late Animation<double> _animation;
    late Animation<double> _containerSizeAnimation;

  final List<IndicatorPosition> _indicatorPositions = [
    IndicatorPosition(Offset(0.25, 0.2), "8,5 mn P"),
    IndicatorPosition(Offset(0.65, 0.3), "11 mn P"),
    IndicatorPosition(Offset(0.15, 0.4), "6,7 mn P"),
    IndicatorPosition(Offset(0.6, 0.6), "5,95 mn P"),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
 _containerSizeAnimation = Tween<double>(begin: 10.0, end: 60.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
     _textFieldAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Image.asset(
            'assets/map.png', // Replace with your image path
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SlideTransition(
                          position: _textFieldAnimation,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            width: 260,
                            child: Material(
                              borderRadius: BorderRadius.circular(30),
                              child: const TextField(
                                decoration: InputDecoration(
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                                  focusColor: Colors.red,
                                  border: InputBorder.none,
                                  labelText: 'Saint Petersburg',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        AnimatedBuilder(
                          animation: _containerSizeAnimation,
                          builder: (context, child) {
                            return Container(
                              width: _containerSizeAnimation.value,
                              height: _containerSizeAnimation.value,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(75),
                                  ),
                                  child: Center(child: Icon(Icons.menu),),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
          for (int i = 0; i < _indicatorPositions.length; i++)
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              curve: Curves.easeOut,
              left: MediaQuery.of(context).size.width *
                  _indicatorPositions[i].offset.dx,
              top: MediaQuery.of(context).size.height *
                  _indicatorPositions[i].offset.dy,
              child: ScaleTransition(
                scale: Tween(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: _animationController,
                    curve: Interval(
                      (i / _indicatorPositions.length),
                      1.0,
                      curve: Curves.easeInOut,
                    ),
                  ),
                ),
                child: IndicatorIcon(
                  txt: _indicatorPositions[i].text,
                ),
              ),
            ),
          Positioned(
            bottom: 120,
            left: 16,
            child: Column(
              children: [
                ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                          parent: _animationController,
                          curve: Curves.easeInOut),
                    ),
                    child: CircularButton(icon: Icons.layers)),
                const SizedBox(height: 16),
                ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                          parent: _animationController,
                          curve: Curves.easeInOut),
                    ),
                    child: CircularButton(
                      icon: Icons.near_me,
                      onTap: (details) {
                        //show menu item dialog
                        showDialog(
                          context: context,
                          builder: (context) => CustomPopupMenu(
                            tapPosition: details.globalPosition,
                          ),
                        );
                      },
                    )),
              ],
            ),
          ),
          Positioned(
            bottom: 120,
            right: 16,
            child: ScaleTransition(
                scale: Tween(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: _animationController, curve: Curves.easeInOut),
                ),
                child: const RoundedRectButton()),
          ),
        ],
    );
  }
}

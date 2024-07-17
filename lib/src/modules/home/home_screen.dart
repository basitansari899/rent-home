import 'package:flutter/material.dart';
import 'package:home_task/src/modules/home/widgets/image_widget.dart';
import 'package:home_task/src/assets/assets.dart';
import 'package:home_task/src/modules/home/widgets/rent_widget.dart';

class ProductHome extends StatefulWidget {
  const ProductHome({super.key});

  @override
  State<ProductHome> createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade100, body: AnimatedExample()),
    );
  }
}

class AnimatedExample extends StatefulWidget {
  @override
  _AnimatedExampleState createState() => _AnimatedExampleState();
}

class _AnimatedExampleState extends State<AnimatedExample>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _fastAnimationcontroller;

  late Animation<Offset> _textFieldAnimation;
  late Animation<double> _containerSizeAnimation;
  late Animation<double> _offercontainerSizeAnimation;
  late Animation<double> _textPositionAnimation;
  late Animation<double> _textOpacityAnimation;
  late Animation<double> _bottomAnimation;

  late Animation<double> _secondTextOpacityAnimation;
  late Animation<int> _numberAnimation;
  late AnimationController _bottomToTopController;
  late Animation<Offset> _bottomToTopAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _fastAnimationcontroller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _textFieldAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _numberAnimation = IntTween(begin: 0, end: 2212).animate(_controller);

    _containerSizeAnimation = Tween<double>(begin: 10.0, end: 60.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _bottomAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _offercontainerSizeAnimation =
        Tween<double>(begin: 50.0, end: 170.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _textPositionAnimation = Tween<double>(begin: 40.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _secondTextOpacityAnimation = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _bottomToTopController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _bottomToTopAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start off-screen (bottom)
      end: const Offset(0, 0), // End at the top
    ).animate(CurvedAnimation(
      parent: _bottomToTopController,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
    _bottomToTopController.forward();
  }


  @override
  void dispose() {
    _bottomToTopController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.2, 0.9], // Adjust stops for smooth transition
                colors: [
                  Colors.brown.shade50.withOpacity(0.2), // light skin color
                  Colors.brown.shade50.withOpacity(0.0), // fade to transparent
                  Colors.brown.shade300.withOpacity(0.9), // light brown color
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SlideTransition(
                          position: _textFieldAnimation,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            width: 220,
                            child: Material(
                              borderRadius: BorderRadius.circular(30),
                              child: const TextField(
                                decoration: InputDecoration(
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal:25,vertical: 5),
                                  focusColor: Colors.red,
                                  border: InputBorder.none,
                                  labelText: 'Saint Petersburg',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        AnimatedBuilder(
                          animation: _containerSizeAnimation,
                          builder: (context, child) {
                            return Container(
                              width: _containerSizeAnimation.value,
                              height: _containerSizeAnimation.value,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(75),
                                  image: const DecorationImage(
                                      image: AssetImage(ImageAsset.woman),
                                      fit: BoxFit.cover)),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Opacity(
                          opacity: _secondTextOpacityAnimation.value,
                          child: Text(
                            'Hi, Marina',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24, color: Colors.grey.shade400),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 50),
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0.0, _textPositionAnimation.value),
                          child: Opacity(
                            opacity: _textOpacityAnimation.value,
                            child: const Row(
                              children: [
                                Text(
                                  'lets\'s select your \n perfect place',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 28),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                 RentWidget(
                  containerSizeAnimation: _containerSizeAnimation,
                  numberAnimation: _numberAnimation,
                  offercontainerSizeAnimation: _offercontainerSizeAnimation,
                 ),
                  SlideTransition(
                    position: _bottomToTopAnimation,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      height: 850,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 14),
                        child: Column(
                          children: [
                             Row(
                              children: [
                                Expanded(
                                  child: ImageWidget(
                                     textFieldAnimation: _textFieldAnimation,
                                      height: 200, imagePath: ImageAsset.room),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Row(
                              children: [
                                 Expanded(
                                  child: ImageWidget(
                                    textFieldAnimation: _textFieldAnimation,
                                    height: 400,
                                    imagePath: ImageAsset.dinning,
                                  ),
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 400,
                                    child:  Column(
                                      children: [
                                        Expanded(
                                          child: ImageWidget(
                                             textFieldAnimation: _textFieldAnimation,
                                            imagePath: ImageAsset.tvArea,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 14,
                                        ),
                                        Expanded(
                                          child: ImageWidget(
                                             textFieldAnimation: _textFieldAnimation,
                                            imagePath: ImageAsset.kitchen,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                           
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        
        ),
      ],
    );
  }
}

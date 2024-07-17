import 'package:flutter/material.dart';

class RentWidget extends StatelessWidget {
  final Animation<double> offercontainerSizeAnimation;
  final Animation<int> numberAnimation;
  final Animation<double> containerSizeAnimation;

  const RentWidget({super.key, 
  required this.offercontainerSizeAnimation, 
  required this.numberAnimation,
  required this.containerSizeAnimation});

  @override
  Widget build(BuildContext context) {
    return  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedBuilder(
                          animation: offercontainerSizeAnimation,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(
                                  0.0, -(containerSizeAnimation.value - 50.0)),
                              child: Container(
                                width: offercontainerSizeAnimation.value,
                                height: offercontainerSizeAnimation.value,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: AnimatedBuilder(
                                    animation: numberAnimation,
                                    builder: (context, child) {
                                      return Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: offercontainerSizeAnimation
                                                    .value <
                                                130.0
                                            ? const SizedBox()
                                            : Column(
                                                children: [
                                                  const Text(
                                                    'RENT',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        offercontainerSizeAnimation
                                                                    .value >
                                                                130.0
                                                            ? 20
                                                            : 0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 16.0),
                                                    child: Text(
                                                      offercontainerSizeAnimation
                                                                  .value >
                                                              130.0
                                                          ? numberAnimation
                                                              .value
                                                              .toString()
                                                          : "",
                                                      style: const TextStyle(
                                                        fontSize: 24,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  offercontainerSizeAnimation
                                                              .value >
                                                          130.0
                                                      ? const Text(
                                                          'Offers',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        )
                                                      : const SizedBox(),
                                                ],
                                              ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        AnimatedBuilder(
                          animation: offercontainerSizeAnimation,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(
                                  0.0, -(containerSizeAnimation.value - 50.0)),
                              child: Container(
                                width: offercontainerSizeAnimation.value,
                                height: offercontainerSizeAnimation.value,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: AnimatedBuilder(
                                    animation: numberAnimation,
                                    builder: (context, child) {
                                      return offercontainerSizeAnimation
                                                  .value <
                                              130.0
                                          ? const SizedBox()
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    'RENT',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 16.0),
                                                    child: Text(
                                                      numberAnimation.value
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontSize: 24,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  const Text(
                                                    'Offers',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
  }
}
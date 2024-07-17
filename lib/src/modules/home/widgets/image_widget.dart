import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final double? height;
  final String imagePath;
  final Animation<Offset> textFieldAnimation;
  const ImageWidget({Key? key, this.height, required this.imagePath, required this.textFieldAnimation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: 10, // Adjust as needed
          left: 10, // Adjust as needed
          right: 10, // To ensure the row fills the width
          child:SlideTransition(
            position: textFieldAnimation,
            child: Row(
              children: <Widget>[
                // The main container with fixed height and expanded width
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.brown.shade300.withOpacity(0.85),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(60),
                          bottomRight: Radius.circular(60),
                          topLeft: Radius.circular(60),
                          bottomLeft: Radius.circular(60),
                        )),
                    // Replace with your desired color
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Spacer(),
                        const Center(
                          child: Text(
                            'Gladkova St.,25', // Replace with your desired text
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                          ),
                        ),
                          Spacer(),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                Colors.white, // Replace with your desired color
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 12,
                            // Icon color
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

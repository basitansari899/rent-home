import 'package:flutter/material.dart';

class IndicatorIcon extends StatelessWidget {
  final String? txt;

  const IndicatorIcon({super.key, required this.txt});
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12),

        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child:  txt != null ?
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Text(txt!,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),),
      ) : 
       Center(
        child: 
        Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
    );
  }
}
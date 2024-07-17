import 'package:flutter/material.dart';

class RoundedRectButton extends StatelessWidget {

  const RoundedRectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.7),
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Row(
        children: [
          Icon(Icons.list, color: Colors.white),
          SizedBox(width: 8),
          Text(
            'List of variants',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
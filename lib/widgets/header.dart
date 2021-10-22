import 'package:computiq_task_week2/core/colors.dart';
import 'package:computiq_task_week2/core/strings.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Today',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            '${monthMap[DateTime.now().month]}  ${DateTime.now().toString().substring(0, 10)}',
            style: const TextStyle(color: secondaryTextColor, fontSize: 11,),
          )
        ],
      ),
    );
  }
}

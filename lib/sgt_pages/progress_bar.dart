import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  final int currentIndex;
  const ProgressBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  late final int _currentIndex = widget.currentIndex;
  final List<String> _pages = ["Shift", "Checkpoint", "Route", "Assign Guard"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Expanded(
        child: Row(
          children: List.generate(_pages.length, (index) {
            final isCurrent = _currentIndex == index;

            final isRecent = index < _currentIndex;
            final color = isCurrent
                ? Colors.indigo[900]
                : isRecent
                    ? Colors.green
                    : Colors.grey;
            print("widget.currentIndex: ${widget.currentIndex}");
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _pages[index],
                    style: TextStyle(color: color),
                  ),
                  const SizedBox(height: 11),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      color: color,
                    ),
                    width: _calculateProgressBarWidth(index),
                    height: 5,
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  double _calculateProgressBarWidth(int index) {
    switch (index) {
      case 0:
        return 65;
      case 1:
        return 102;
      case 2:
        return 73;
      case 3:
        return 103;
      default:
        return 0;
    }
  }
}

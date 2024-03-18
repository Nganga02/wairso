import 'package:flutter/material.dart';
import 'package:wairso/models/destination.dart';

class TopNavigationBar extends StatefulWidget {
  TopNavigationBar({
    Key? key,
    required this.onTap,
    required this.labels,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;
  final void Function(int index) onTap;
  final List<Destination> labels;

  @override
  State<TopNavigationBar> createState() => _TopNavigationBarState();
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
        boxShadow: const [BoxShadow(
          blurRadius: 0.03
        )],
        color: Theme.of(context).scaffoldBackgroundColor
      ),
      child: Row(
        children: widget.labels
            .map(
              (label) => Expanded(
                flex: widget.labels.length,
                child: InkWell(
                  onTap: () {
                   widget.onTap(label.index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Center(
                      child: Text(label.text,
                          style: widget.currentIndex == label.index
                              ? label.style
                              : const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

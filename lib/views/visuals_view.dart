import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wairso/models/destination.dart';
import 'package:wairso/views/manual_view.dart';
import 'package:wairso/views/startus_view.dart';
import 'package:wairso/widgets/navigation_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class VisualsView extends StatefulWidget {
  VisualsView({Key? key, required this.pool}) : super(key: key);

  final String pool;

  @override
  State<VisualsView> createState() => _VisualsViewState();
}

class _VisualsViewState extends State<VisualsView> {
  static final List<Destination> _icons = [
    Destination(index: 0, text: "Manual"),
    Destination(index: 1, text: "Status"),
    Destination(index: 2, text: "Graph"),
  ];
  late int currentIndex = 1;

  void _onSelect(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> screens = [const ManualView(), const StatusView()];

  @override
  Widget build(BuildContext context) {
    Future<bool> _isConnected() async {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.wifi) {
        return true;
      } else {
        return false;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pool),
      ),
      body: Column(
        children: [
          TopNavigationBar(
            onTap: _onSelect,
            currentIndex: currentIndex,
            labels: _VisualsViewState._icons,
          ),
          screens[currentIndex],
        ],
      ),
    );
  }
}

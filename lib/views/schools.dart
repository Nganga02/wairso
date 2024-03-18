import 'package:flutter/material.dart';
import 'package:wairso/models/drawer.dart';
import 'package:wairso/views/pools_view.dart';

class SchoolView extends StatelessWidget {
  SchoolView({Key? key, required this.userCredentials}) : super(key: key);

  final Map<String, dynamic> userCredentials;
  final List<String> _account = [
    "ASSISI",
    "Account 1",
    "Ace Learn to swim",
    "All Seasons holiday park",
    "Ashhurst Pool",
    "Auckland pool"
    "Auroa School",
    "Awahono School",
    "Bankwood School"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Accounts",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        endDrawer: CustomDrawer(userCredentials: userCredentials),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: ListView(
            children: _account
                .map((account) => InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => PoolsView(title: account),
                          ),
                        );
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            account,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}


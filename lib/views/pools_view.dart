import 'package:flutter/material.dart';
import 'package:wairso/constants/dummy_data.dart';
import 'package:wairso/views/visuals_view.dart';

class PoolsView extends StatelessWidget {
  const PoolsView({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: checker(pools: dummyPools[title]!, context: context));
  }
}

Widget checker({required List<String?> pools, required BuildContext context}) {
  Widget content;
  if (pools.isEmpty) {
    content = const Center(
      child: Text("No active devices for this account"),
    );
  } else {
    content = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: ListView(
        children: pools
            .map(
              (pool) => InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => VisualsView(pool: pool,)));
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(pool!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
  return content;
}

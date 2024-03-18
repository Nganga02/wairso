import 'package:flutter/material.dart';

class ManualView extends StatelessWidget {
  const ManualView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            _buildContainer(
                context: context, title: "Disinfectant", manualDose: true),
            _buildContainer(
              context: context,
              title: "pH",
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 10)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      height: 40,
                      child: const Center(
                        child: Text(
                          "Last Reading",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      height: 40,
                      child: const Center(
                        child: Text(
                          "2.06 ppm Cl",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      height: 40,
                      child: const Center(
                        child: Text(
                          "7.63 pH",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text("Measure Disinfectant")),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Measure pH"),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("Flush Sampler"),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("Clean Sampler"),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Prime DPD reagent Pump"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Prime DPD reagent Pump"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Padding _buildContainer(
    {required BuildContext context,
    required String title,
    bool? manualDose = false}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            height: 40,
            child: Center(
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: Center(
              child: Text(
                "Data to be logged",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 30,
                    ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        "Start",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[700]),
                      child: const Text(
                        "Stop",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              manualDose!
                  ? Expanded(
                      flex: 2,
                      child: SizedBox(
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 26, 145, 211)),
                            child: const Text(
                              "Manual Dose",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container()
            ],
          )
        ],
      ),
    ),
  );
}

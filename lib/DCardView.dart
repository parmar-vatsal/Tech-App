import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DCardView extends StatelessWidget {
  const DCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < 50; i++) ...[
              SafeArea(
                  child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int j = 0; j < 50; j++) ...[
                      Container(
                        height: 100,
                        width: 100,
                        child: Card(
                          color: Colors.red,
                          child: Center(child: Text("fruit")),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ]
                  ],
                ),
              ))
            ],
          ],
        ),
      )),
    );
  }
}

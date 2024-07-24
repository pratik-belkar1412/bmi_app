import 'package:bmi_app/bmi_provider.dart';
import 'package:bmi_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bmiNotifier = ref.watch(bmiProvider);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: backgroundColour,
      ),
      backgroundColor: backgroundColour,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: kActiveCardDecoration,
            child: Center(
                child: Text(
              bmiNotifier.bmiResult!.toStringAsFixed(1),
              style: kTitleTextStyle,
            )),
          ),
        ),
      ),
    );
  }
}

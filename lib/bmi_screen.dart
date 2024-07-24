import 'package:bmi_app/bmi_provider.dart';
import 'package:bmi_app/constant.dart';
import 'package:bmi_app/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BMIScreen extends ConsumerWidget {
  const BMIScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bmiNotifier = ref.watch(bmiProvider);

    final width = MediaQuery.of(context).size.width;
    final boxWidth = width * 0.45;
    return Scaffold(
      backgroundColor: backgroundColour,
      appBar: AppBar(
        backgroundColor: backgroundColour,
        title: Center(
          child: Text(
            'BMI CALCULATOR',
            style: kTitleTextStyle.copyWith(fontSize: 20),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  ref.read(bmiProvider.notifier).setGendertoMale();
                },
                child: Container(
                  width: boxWidth,
                  height: boxWidth,
                  decoration: bmiNotifier.isMale!
                      ? kActiveCardDecoration
                      : kInactiveCardDecoration,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.mars,
                        size: 60,
                        color: Colors.white,
                      ),
                      Text(
                        'Male',
                        style: kTitleTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  ref.read(bmiProvider.notifier).setGendertoFemale();
                },
                child: Container(
                  width: boxWidth,
                  height: boxWidth,
                  decoration: !bmiNotifier.isMale!
                      ? kActiveCardDecoration
                      : kInactiveCardDecoration,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.venus,
                        size: 60,
                        color: Colors.white,
                      ),
                      Text(
                        'Female',
                        style: kTitleTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: width * 0.93,
            height: boxWidth,
            decoration: kActiveCardDecoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Height',
                  style: kTitleTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      bmiNotifier.height!.floor().toString(),
                      style: kTitleTextStyle,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('cm',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white.withOpacity(0.5),
                        )),
                  ],
                ),
                SliderTheme(
                  data: const SliderThemeData().copyWith(
                    activeTrackColor: Colors.pink[800],
                    thumbColor: Colors.pink[800],
                    overlayColor: Colors.pink.withOpacity(0.5),
                  ),
                  child: Slider(
                    min: 100,
                    max: 200,
                    value: bmiNotifier.height!,
                    onChanged: (value) {
                      ref.read(bmiProvider.notifier).updateHeight(value);
                    },
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: boxWidth,
                height: boxWidth,
                decoration: kActiveCardDecoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Weight',
                      style: kTitleTextStyle,
                    ),
                    Text(bmiNotifier.weight.toString(), style: kTitleTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ref.read(bmiProvider.notifier).decreamentWeight();
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: kInactiveCardDecoration,
                            child: const Center(
                              child: Text(
                                '-',
                                style: kTitleTextStyle,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ref.read(bmiProvider.notifier).increamentWeight();
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: kInactiveCardDecoration,
                            child: const Center(
                              child: Text(
                                '+',
                                style: kTitleTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: boxWidth,
                height: boxWidth,
                decoration: kActiveCardDecoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Age', style: kTitleTextStyle),
                    Text(bmiNotifier.age!.toString(), style: kTitleTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ref.read(bmiProvider.notifier).decreamentAge();
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: kInactiveCardDecoration,
                            child: const Center(
                              child: Text(
                                '-',
                                style: kTitleTextStyle,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ref.read(bmiProvider.notifier).increamentAge();
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: kInactiveCardDecoration,
                            child: const Center(
                              child: Text(
                                '+',
                                style: kTitleTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              ref.read(bmiProvider.notifier).calculateBmi();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ResultScreen(),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 80,
              color: Colors.pink[800],
              child: Center(
                child: Text(
                  'CALCULATE YOUR BMI',
                  style: kTitleTextStyle.copyWith(fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// weight in Kilogram
// height squared in Meter
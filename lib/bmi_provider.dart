import 'package:flutter_riverpod/flutter_riverpod.dart';

class BMIModel {
  final bool? isMale;
  final int? weight;
  final int? age;
  final double? height;
  final double? bmiResult;

  BMIModel({this.isMale, this.weight, this.age, this.height, this.bmiResult});

  BMIModel copyWith({
    bool? isMale,
    int? weight,
    int? age,
    double? height,
    double? bmiResult,
  }) {
    return BMIModel(
      isMale: isMale ?? this.isMale,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      height: height ?? this.height,
      bmiResult: bmiResult ?? this.bmiResult,
    );
  }
}

class BmiProvider extends StateNotifier<BMIModel> {
  BmiProvider()
      : super(BMIModel(
          height: 120,
          weight: 60,
          age: 20,
          isMale: true,
          bmiResult: 0,
        ));

  void setGendertoMale() {
    state = state.copyWith(isMale: true);
  }

  void setGendertoFemale() {
    state = state.copyWith(isMale: false);
  }

  void updateHeight(double height) {
    state = state.copyWith(height: height);
  }

  void increamentWeight() {
    state = state.copyWith(weight: state.weight! + 1);
  }

  void decreamentWeight() {
    state = state.copyWith(weight: state.weight! - 1);
  }

  void increamentAge() {
    state = state.copyWith(age: state.age! + 1);
  }

  void decreamentAge() {
    state = state.copyWith(age: state.age! - 1);
  }

  void calculateBmi() {
    final bmi = state.weight! / ((state.height! / 100) * (state.height! / 100));
    state = state.copyWith(bmiResult: bmi);
  }
}

final bmiProvider =
    StateNotifierProvider<BmiProvider, BMIModel>((ref) => BmiProvider());

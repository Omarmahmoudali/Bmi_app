abstract class BmiStates {}

class AppInitialState extends BmiStates{}

class IsMaleState extends BmiStates{}

class IsFemaleState extends BmiStates{}

class SliderState extends BmiStates{}

class WeightMinusState extends BmiStates{
  final int weight;

  WeightMinusState(this.weight);
}

class WeightPlusState extends BmiStates{
  final int weight;

  WeightPlusState(this.weight);
}

class AgeMinusState extends BmiStates{
  final int age;

  AgeMinusState(this.age);
}

class AgePlusState extends BmiStates{
  final int age;

  AgePlusState(this.age);
}
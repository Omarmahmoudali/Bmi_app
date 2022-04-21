import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bmi_states.dart';

class BmiCubit extends Cubit<BmiStates>{
  BmiCubit() : super(AppInitialState());

  static BmiCubit get(context) => BlocProvider.of(context);

  bool isMale = true;
  double height = 120.0;
  int age = 20;
  int weight = 50;

  void male(){
    isMale = true;
    emit(IsMaleState());
  }

  void female(){
    isMale = false;
    emit(IsFemaleState());
  }

  void slider(value){
    height=value;
    emit(SliderState());
  }

  void minusWeight(){
    weight--;
    emit(WeightMinusState(weight));
  }

  void plusWeight(){
    weight++;
    emit(WeightPlusState(weight));
  }

  void minusAge(){
   age--;
    emit(WeightPlusState(age));
  }

  void plusAge(){
    age++;
    emit(WeightPlusState(age));
  }



}
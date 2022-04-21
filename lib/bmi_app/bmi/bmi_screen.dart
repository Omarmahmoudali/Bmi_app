import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bmi_result/bmi_result_screen.dart';
import 'cubit/bmi_cubit.dart';
import 'cubit/bmi_states.dart';

class BmiScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>BmiCubit(),
      child: BlocConsumer<BmiCubit,BmiStates>(
        listener: (context,state){},
        builder: (context,state){
          BmiCubit cubit = BmiCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('BMI Calculator'),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              cubit.male();
                            },
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/image/male.png',
                                    width: 100.0,
                                    height: 100.0,
                                  ),
                                  const Text(
                                    'MALE',
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: cubit.isMale ? Colors.blue : Colors.grey[400],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                               cubit.female();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color:cubit.isMale ? Colors.grey[400] : Colors.blue,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/image/female.png',
                                    width: 100.0,
                                    height: 100.0,
                                  ),
                                  const Text(
                                    'Female',
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'HEIGHT',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25.0),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '${cubit.height.round()}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 40.0),
                              ),
                              const Text(
                                'CM',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20.0),
                              ),
                            ],
                          ),
                          Slider(
                              value:cubit.height,
                              max: 220.0,
                              min: 80.0,
                              onChanged: (value) {
                                 cubit.slider(value);
                              })
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[400],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Weight',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 25.0),
                                ),
                                Text(
                                  '${cubit.weight}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 25.0),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                      onPressed: () {
                                          cubit.minusWeight();
                                      },
                                      mini: true,
                                      child: const Icon(Icons.remove),
                                    ),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    FloatingActionButton(
                                      onPressed: () {
                                          cubit.plusWeight();
                                      },
                                      mini: true,
                                      child: const Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[400],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'AGE',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 25.0),
                                ),
                                Text(
                                  '${cubit.age}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 25.0),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                      onPressed: () {
                                         cubit.minusAge();
                                      },
                                      mini: true,
                                      child: const Icon(Icons.remove),
                                    ),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    FloatingActionButton(
                                      onPressed: () {
                                         cubit.plusAge();
                                      },
                                      mini: true,
                                      child: const Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.blue,
                  child: MaterialButton(
                    height: 50.0,
                    onPressed: () {
                      var result =cubit.weight / pow(cubit.height / 100, 2);
                      print(result.round());

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BMIResultScreen(
                            result: result.round(),
                            age: cubit.age,
                            isMale: cubit.isMale,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Calculate',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

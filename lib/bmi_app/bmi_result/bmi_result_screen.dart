import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  final bool isMale;
  final int  age;
  final int result;

const BMIResultScreen({Key? key,
        required this.isMale,
        required this.age,
        required this.result
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bmi Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender : ${isMale ? 'Male' : 'Female'}',
              style: const TextStyle(
                fontSize: 30.0,
              ),
            ),
            Text(
              'Age : $age',
              style: const TextStyle(
                fontSize: 30.0,
              ),
            ),
            Text(
              'Result : $result',
              style: const TextStyle(
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

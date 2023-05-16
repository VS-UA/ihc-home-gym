import 'package:flutter/material.dart';

class ExercisePage extends StatefulWidget {
  final String exercise;

  const ExercisePage(this.exercise, {Key? key}) : super(key: key);

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercise"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            if (widget.exercise == 'Pullups') ...[
              Image.network('https://fitnessprogramer.com/wp-content/uploads/2021/02/Pull-up.gif'),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'A pull-up is a common upper-body exercise that primarily targets the muscles of the back, shoulders, and arms. It is performed by hanging from a horizontal bar with an overhand grip and pulling the body up until the chin surpasses the level of the bar.',
                style: TextStyle(
                  height: 1.5,
                  fontSize: 15,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
            if (widget.exercise == 'Bench Dip') ...[
              Image.network('https://gymvisual.com/img/p/1/4/5/3/0/14530.gif'),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Bench dips, also known as tricep bench dips or chair dips, are a compound exercise primarily targeting the triceps muscles located on the back of the upper arm. This exercise can be performed using a sturdy bench, chair, or any elevated surface that can support your weight.',
                style: TextStyle(
                  height: 1.5,
                  fontSize: 15,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
            if (widget.exercise == 'Lateral Raise') ...[
              Image.network('https://gymvisual.com/img/p/1/9/1/5/1/19151.gif'),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Lateral raises, also known as lateral deltoid raises or side raises, are a popular exercise that targets the lateral deltoid muscles of the shoulders. This exercise helps to strengthen and tone the muscles responsible for lifting your arms to the sides.',
                style: TextStyle(
                  height: 1.5,
                  fontSize: 15,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

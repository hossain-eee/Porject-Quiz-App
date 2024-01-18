import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    bool isAnswerCorrect;
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((data) {
          isAnswerCorrect = data['correct_answer'] == data['user_answer'];
          print("isAnswerCorrect : $isAnswerCorrect");

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor:
                    isAnswerCorrect ? Colors.greenAccent : Colors.pink[200],
                child: Text(
                  ((data['question_index'] as int) + 1).toString(),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['question'] as String,
                      style: const TextStyle(color: Colors.white),
                    ), //type cast to String
                    Text(
                      data['correct_answer'] as String,
                      style: const TextStyle(color: Colors.grey),
                    ), //type cast to String
                    Text(
                      data['user_answer'] as String,
                      style: TextStyle(
                        color: isAnswerCorrect
                            ? Colors.greenAccent
                            : Colors.orangeAccent,
                      ),
                    ), //type cast to String
                  ],
                ),
              ),
            ],
          );
        }).toList()),
      ),
    );
  }
}

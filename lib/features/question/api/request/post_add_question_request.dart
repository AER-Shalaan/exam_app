/* هنا في naming convention بتاع ال class نفسه
 بلس انت مش هتستخدم ده خالص 
 الصح 
{
دي ال request اللي هتبعت في ال post check question endpoint
    ال list of answers دي هتبعت فيها ال id بتاع السؤال و الاجابة اللي انت اخترتها و ال time بتاع الامتحان كله
    "answers": [
        {
            "questionId": "6715e98c76fb2b224b2ffe2c",
            "correct": "A4"
        },
        {
            "questionId": "6715e98d76fb2b224b2ffe2f",
            "correct": "A4"
        }
    ],
    "time":10
}
 فأنت محتاج  تعمل class اسمه postCheckQuestionRequest و فيه list of answer و ال time
و ال answer class دي هتحتوي علي questionId و correct
 */

class postAddQuestionRequest {
  String question;
  String A1;
  String A2;
  String A3;
  String A4;
  String correct;
  String subject;
  String exam;

  postAddQuestionRequest({
    required this.question,
    required this.A1,
    required this.A2,
    required this.A3,
    required this.A4,
    required this.correct,
    required this.subject,
    required this.exam,
  });

  Map<String, dynamic> toJson() => {
    "question": question,
    "A1": A1,
    "A2": A2,
    "A3": A3,
    "A4": A4,
    "correct": correct,
    "subject": subject,
    "exam": exam,
  };
}


    // "question":"How can you open a link in a new tab/browser window?",
    // "A1":" <a href='url' new>",
    // "A2":" <a href='url' target='new'>",
    // "A3":" <a href='url' target='_blank'>",
    // "A4":"~",
    // "correct":"A3",
    // "subject": "670037f6728c92b7fdf434fc",
    // "exam":"670070a830a3c3c1944a9c63"

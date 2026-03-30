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

class PostAddQuestionRequest {
  String? time;
  List<Answer>? answers;

  PostAddQuestionRequest({
    this.time,
    this.answers,
  });
}

class Answer {
  String? questionId;
  String? correct;

  Answer({
    this.questionId,
    this.correct,
  });
}

abstract class ExamsEvents {}

class GetExamsEvent extends ExamsEvents {
  final String subjectId;

  GetExamsEvent({required this.subjectId});
}

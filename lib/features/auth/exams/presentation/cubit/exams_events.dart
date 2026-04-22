abstract class ExamsEvents {}

class GetExamsEvent extends ExamsEvents {
  final String? subjectId;

  GetExamsEvent({this.subjectId});
}

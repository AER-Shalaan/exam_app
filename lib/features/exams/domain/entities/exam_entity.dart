class ExamResponseEntity {
  final String? message;
  final ExamMetadataEntity? metadata;
  final List<ExamEntity>? exams;

  ExamResponseEntity({this.message, this.metadata, this.exams});
}

class ExamMetadataEntity {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;

  ExamMetadataEntity({this.currentPage, this.numberOfPages, this.limit});
}

class ExamEntity {
  final String? id;
  final String? title;
  final int? duration;
  final String? subject;
  final int? numberOfQuestions;
  final bool? active;
  final String? createdAt;

  ExamEntity({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });
}

import 'package:equatable/equatable.dart';

class ExamResponseEntity extends Equatable {
  final String? message;
  final ExamMetadataEntity? metadata;
  final List<ExamEntity>? exams;

  const ExamResponseEntity({this.message, this.metadata, this.exams});

  @override
  List<Object?> get props => [message, metadata, exams];
}

class ExamMetadataEntity extends Equatable {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;

  const ExamMetadataEntity({this.currentPage, this.numberOfPages, this.limit});

  @override
  List<Object?> get props => [currentPage, numberOfPages, limit];
}

class ExamEntity extends Equatable {
  final String? id;
  final String? title;
  final int? duration;
  final String? subject;
  final int? numberOfQuestions;
  final bool? active;
  final DateTime? createdAt;

  const ExamEntity({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        duration,
        subject,
        numberOfQuestions,
        active,
        createdAt,
      ];
}

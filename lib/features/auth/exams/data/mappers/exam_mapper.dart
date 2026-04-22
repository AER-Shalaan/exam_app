import 'package:exam_app/features/auth/exams/apis/response/exam_response.dart';
import 'package:exam_app/features/auth/exams/domain/entities/exam_entity.dart';

extension ExamResponseMapper on ExamResponse {
  ExamResponseEntity toEntity() {
    return ExamResponseEntity(
      message: message,
      metadata: metadata?.toEntity(),
      exams: exams?.map((e) => e.toEntity()).toList(),
    );
  }
}

extension ExamMetadataModelMapper on ExamMetadataModel {
  ExamMetadataEntity toEntity() {
    return ExamMetadataEntity(
      currentPage: currentPage,
      numberOfPages: numberOfPages,
      limit: limit,
    );
  }
}

extension ExamModelMapper on ExamModel {
  ExamEntity toEntity() {
    return ExamEntity(
      id: id,
      title: title,
      duration: duration,
      subject: subject,
      numberOfQuestions: numberOfQuestions,
      active: active,
      createdAt: createdAt,
    );
  }
}

import 'package:example_app/extensions/date_time_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary.freezed.dart';

@freezed
class Diary with _$Diary {
  const Diary._();

  factory Diary(String id, DateTime createdAt,
      {@Default('') String title,
      @Default('') String content,
      @Default('') String imagePath}) = _Diary;

  String get formattedCreatedAtString =>
      createdAt.formattedString(format: 'yyyy/MM/dd(E)');
}

import 'package:example_app/core/diaries/models/diary.dart';
import 'package:example_app/shared/models/app_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diaries_page_state.freezed.dart';

@freezed
class DiariesPageState with _$DiariesPageState {
  const DiariesPageState._();

  factory DiariesPageState({
    @Default(false) bool isLoading,
    AppException? exception,
    @Default([]) List<Diary> diaries,
  }) = _EditingDiaryState;
}

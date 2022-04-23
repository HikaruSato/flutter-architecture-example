import 'package:example_app/core/diaries/models/diary.dart';
import 'package:example_app/core/diaries/repositories/diary_repository.dart';
import 'package:example_app/core/diaries/repositories/diary_repository_impl.dart';
import 'package:example_app/shared/models/app_exception.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diaries_controller.freezed.dart';

@freezed
class DiariesPageState with _$DiariesPageState {
  const DiariesPageState._();

  factory DiariesPageState({
    @Default(false) bool isLoading,
    AppException? exception,
    @Default([]) List<Diary> diaries,
  }) = _DiariesPageState;
}

final diariesControllerProvider = StateNotifierProvider.autoDispose<DiariesController, DiariesPageState>((ref) => DiariesController(ref.read));

class DiariesController extends StateNotifier<DiariesPageState> {
  DiariesController(this._reader) : super(DiariesPageState());

  final Reader _reader;

  late final DiaryRepository _diaryRepository = _reader(diaryRepositoryProvider);

  bool _isAllDiariesLoaded = false;

  Future<void> getDiaries({
    isInit = false,
    isLoadingIndicatorShown = false,
  }) async {
    if (isInit) {
      _isAllDiariesLoaded = false;
    }

    if (_isAllDiariesLoaded) return Future.value();

    if (isLoadingIndicatorShown) {
      state = state.copyWith(isLoading: true);
    }

    try {
      List<Diary> allDiaries = [...state.diaries];
      List<Diary> diaries;

      if (isInit) {
        allDiaries.clear();
        diaries = await _diaryRepository.getDiaries(startIndex: 0);
      } else {
        diaries = await _diaryRepository.getDiaries(
          startIndex: state.diaries.length,
        );
      }

      _isAllDiariesLoaded = diaries.isEmpty;

      state = state.copyWith(
        isLoading: false,
        diaries: allDiaries..addAll(diaries),
        exception: null,
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
      state = state.copyWith(
        isLoading: false,
        exception: AppException(innerException: e, message: '一覧の取得に失敗しました'),
      );
    } catch (e) {
      debugPrint(e.toString());
      state = state.copyWith(
        isLoading: false,
        exception: AppException(message: '一覧の取得に失敗しました'),
      );
    }
  }
}

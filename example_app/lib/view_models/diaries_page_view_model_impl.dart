import 'package:example_app/models/app_exception.dart';
import 'package:example_app/models/diary.dart';
import 'package:example_app/models/states/diaries_page_state.dart';
import 'package:example_app/repositories/diary_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final diariesPageViewModelProvider =
    StateNotifierProvider.autoDispose<DiariesPageViewModel, DiariesPageState>(
        (ref) => DiariesPageViewModel(ref.read));

class DiariesPageViewModel extends StateNotifier<DiariesPageState> {
  DiariesPageViewModel(this._reader) : super(DiariesPageState());

  final Reader _reader;

  late final DiaryRepository _diaryRepository =
      _reader(diaryRepositoryProvider);

  bool _isAllDiariesLoaded = false;

  Future<void> getDiaries({isInit = false}) async {
    if (isInit) {
      _isAllDiariesLoaded = true;
    }

    if (_isAllDiariesLoaded) return Future.value();

    state = state.copyWith(isLoading: true);

    try {
      List<Diary> allDiaries = state.diaries;
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
      );
    } on Exception catch (e) {
      state = state.copyWith(
        isLoading: false,
        exception: AppException(innerException: e, message: '一覧の取得に失敗しました'),
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        exception: AppException(message: '一覧の取得に失敗しました'),
      );
    }
  }
}

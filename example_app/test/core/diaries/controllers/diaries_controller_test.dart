import 'package:example_app/core/diaries/controllers/diaries_controller.dart';
import 'package:example_app/core/diaries/models/diary.dart';
import 'package:example_app/core/diaries/repositories/diary_repository_impl.dart';
import 'package:example_app/shared/models/app_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FakeDiaryRepository implements DiaryRepository {
  FakeDiaryRepository({required this.mockGetDiaries});

  final Future<List<Diary>> Function() mockGetDiaries;

  @override
  Future<List<Diary>> getDiaries({startIndex = 0, count = 30}) {
    return mockGetDiaries();
  }
}

void main() {
  group('DiariesController#getDiaries', () {
    late Future<List<Diary>> mockGetDiaries;
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer(
        overrides: [
          diaryRepositoryProvider.overrideWithProvider(
            Provider((ref) => FakeDiaryRepository(mockGetDiaries: () => mockGetDiaries)),
          ),
        ],
      );
    });

    test('リストがstateに設定されていること', () async {
      final controller = container
          .listen(
            diariesControllerProvider.notifier.select((value) => value),
            (previous, next) {},
          )
          .read();
      final createdAt = DateTime.now();

      // 初回読み込み
      mockGetDiaries = Future(() => [Diary('1', createdAt)]);
      await controller.getDiaries(isInit: true);
      DiariesPageState state = container.read(diariesControllerProvider);
      expect(state.diaries.length, 1);
      expect(state.diaries[0], Diary('1', createdAt));

      // 追加読み込み
      mockGetDiaries = Future(() => [Diary('2', createdAt)]);
      await controller.getDiaries();
      state = container.read(diariesControllerProvider);
      expect(state.diaries.length, 2);
      expect(state.diaries[0], Diary('1', createdAt));
      expect(state.diaries[1], Diary('2', createdAt));
    });

    test('リスト取得でエラーの場合にExceptionがstateに設定されていること', () async {
      final controller = container
          .listen(
            diariesControllerProvider.notifier.select((value) => value),
            (previous, next) {},
          )
          .read();

      mockGetDiaries = Future.error(Exception('error'));
      await controller.getDiaries();
      final state = controller.debugState;
      expect(state.exception, isException);
      expect((state.exception as AppException).message, '一覧の取得に失敗しました');
    });
  });
}

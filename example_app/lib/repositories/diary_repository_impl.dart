import 'package:example_app/models/diary.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class DiaryRepository {
  Future<List<Diary>> getDiaries({startIndex = 0, count = 30});
}

final diaryRepositoryProvider = Provider((ref) => DiaryRepositoryImpl());

class DiaryRepositoryImpl implements DiaryRepository {
  DiaryRepositoryImpl();

  final int maxCount = 100;

  @override
  Future<List<Diary>> getDiaries({startIndex = 0, count = 30}) async {
    List<Diary> diaries = [];
    for (var i = startIndex; i <= count; i++) {
      if (i == maxCount - 1) break;

      diaries.add(
        Diary(
          i.toString(),
          DateTime.now(),
          content: 'コンテンツ$i',
          imagePath: 'assets/cat${i % 3 + 1}.jpg',
        ),
      );
    }

    return diaries;
  }
}

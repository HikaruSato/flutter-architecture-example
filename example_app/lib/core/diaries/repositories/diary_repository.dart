import 'package:example_app/core/diaries/models/diary.dart';

abstract class DiaryRepository {
  Future<List<Diary>> getDiaries({startIndex = 0});
}

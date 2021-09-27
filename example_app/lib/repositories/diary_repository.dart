import 'package:example_app/models/diary.dart';

abstract class DiaryRepository {
  Future<List<Diary>> getDiaries({startIndex = 0});
}

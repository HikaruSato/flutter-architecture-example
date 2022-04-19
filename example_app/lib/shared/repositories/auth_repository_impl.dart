import 'package:example_app/shared/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider((ref) => AuthRepositoryImpl());

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl();

  @override
  String? get currentUserId {
    return "testUserId";
  }
}

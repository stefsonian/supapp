import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/providers/supabase_provider.dart';
import '../../data/supabase_auth_repository.dart';
import '../../domain/auth_repository.dart';

part 'auth_state.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return SupabaseAuthRepository(client);
}

@Riverpod(keepAlive: true)
Stream<bool> authStateChanges(Ref ref) {
  return ref.watch(authRepositoryProvider).authStateChanges;
}

@Riverpod(keepAlive: true)
User? currentUser(Ref ref) {
  return Supabase.instance.client.auth.currentUser;
}

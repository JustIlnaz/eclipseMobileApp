import 'package:eclipse_app/database/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final Supabase _supabase = Supabase.instance;

  Future<LocalUser?> signIn(String email, String password) async {
    try {
      AuthResponse authResponse = await _supabase.client.auth
          .signInWithPassword(email: email, password: password);

        User user = authResponse.user!;

      return LocalUser.fromSupabase(user);
    } catch (e) {
      return null;
    }
  }

  Future<LocalUser?> signUp(String email, String password) async {
    try {
      AuthResponse authResponse = await _supabase.client.auth.signUp(
        email: email,
        password: password,
      );

      User user = authResponse.user!;

      return LocalUser.fromSupabase(user);
    } catch (e) {
      return null;
    }
  }

  Future<void> logOut() async {
    try {
      return await _supabase.client.auth.signOut();
    } catch (e) {
      return;
    }
  }

  Future recoveryPassword(String email) async {
    try {
      await _supabase.client.auth.resetPasswordForEmail(email);
    } catch (e) {
      return;
    }
  }
}

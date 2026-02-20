import 'package:supabase_flutter/supabase_flutter.dart';

class UserTable {
  final Supabase supabase = Supabase.instance;

  Future<void> addUserTable(
    String fullname,
    String email,
    String password,
    String gender,
    String date,
    String avatar,
  ) async {
    try {
      await supabase.client.from('users').insert({
        'fullname': fullname,
        'email': email,
        'password': password,
        'gender': gender,
        'dateofbirth': date,
        'avatar': '',
      });

      print('ДОБАВЛЕН ПОЛЬЗОВАТЕЛЬ'); 
    } catch (e) {
      return;
    }
  }
}

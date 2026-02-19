import 'package:supabase_flutter/supabase_flutter.dart';

class LocalUser {
  String? id;

  LocalUser.fromSupabase(User user) {
    id = user.id;
    
  }
}

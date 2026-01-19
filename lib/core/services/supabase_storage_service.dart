import 'dart:io';

import 'package:ecommerce_app_dashboard/config/urls.dart';
import 'package:ecommerce_app_dashboard/core/services/storage_service.dart';
import 'package:ecommerce_app_dashboard/core/utils/backend_break_point.dart';
import 'package:path/path.dart' as p;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../config/api_keys.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: Urls.supabaseUrl,
      anonKey: ApiKeys.kSupabaseApiKey,
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    final fileName = p.basename(file.path);
    var result = await _supabase.client.storage
        .from(BackendBreakPoint.images)
        .upload("$path/$fileName", file);
    return result;
  }
}

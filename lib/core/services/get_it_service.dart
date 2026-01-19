import 'package:ecommerce_app_dashboard/core/repositories/product_repo.dart';
import 'package:ecommerce_app_dashboard/core/repositories/product_repo_impl.dart';
import 'package:ecommerce_app_dashboard/core/services/database_service.dart';
import 'package:ecommerce_app_dashboard/core/services/firestore_service.dart';
import 'package:ecommerce_app_dashboard/core/services/storage_service.dart';
import 'package:ecommerce_app_dashboard/core/services/supabase_storage_service.dart';
import 'package:get_it/get_it.dart';

import '../repositories/images_repo.dart';
import '../repositories/images_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageService>(SupabaseStorageService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());

  getIt.registerSingleton<ImagesRepo>(ImagesRepoImpl(getIt<StorageService>()));
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(databaseService: getIt<DatabaseService>()),
  );
}

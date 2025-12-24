import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../utils/constants.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/presentation/cubits/auth_cubit.dart';
import '../../features/books/data/datasources/books_remote_datasource.dart';
import '../../features/books/data/repositories/books_repository_impl.dart';
import '../../features/books/domain/repositories/books_repository.dart';
import '../../features/books/presentation/cubits/books_cubit.dart';
import '../../features/cart/presentation/cubits/cart_cubit.dart';
import '../../features/profile/presentation/cubits/order_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ! Core
  await Supabase.initialize(
    url: AppConstants.supabaseUrl,
    anonKey: AppConstants.supabaseAnonKey,
  );
  
  sl.registerLazySingleton(() => Supabase.instance.client);

  // ! Features - Auth
  // Bloc
  sl.registerFactory(() => AuthCubit(authRepository: sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(supabaseClient: sl()),
  );
  
  // ! Features - Books
  // Bloc
  sl.registerFactory(() => BooksCubit(booksRepository: sl()));

  // Repository
  sl.registerLazySingleton<BooksRepository>(
    () => BooksRepositoryImpl(remoteDataSource: sl()),
  );

  // Data Sources
  sl.registerLazySingleton<BooksRemoteDataSource>(
    () => BooksRemoteDataSourceImpl(supabaseClient: sl()),
  );
  
  // ! Features - Cart
  sl.registerFactory(() => CartCubit());

  // ! Features - Profile
  sl.registerFactory(() => OrderCubit());
}

// void _initAuth() {
  // Data Sources
  // Repositories
  // Blocs
// }

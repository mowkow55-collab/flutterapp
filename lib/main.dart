import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/cubits/auth_cubit.dart';
import 'features/books/presentation/cubits/books_cubit.dart';
import 'features/cart/presentation/cubits/cart_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await di.init();
  
  runApp(const BookHavenApp());
}

class BookHavenApp extends StatelessWidget {
  const BookHavenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<AuthCubit>()),
        BlocProvider(create: (_) => di.sl<BooksCubit>()),
        BlocProvider(create: (_) => di.sl<CartCubit>()),
      ],
      child: MaterialApp.router(
        title: 'Book Haven',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: appRouter,
      ),
    );
  }
}

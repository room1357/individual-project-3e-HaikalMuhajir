import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/routes/app_routes.dart';
import 'core/services/auth_viewmodel.dart';
import 'ui/pages/index/index_page.dart';
import 'ui/pages/login/login_page.dart';
import 'ui/pages/register/register_page.dart';
import 'ui/pages/home/home_page.dart';
import 'ui/pages/login/login_viewmodel.dart';
import 'ui/pages/register/register_viewmodel.dart';
import 'ui/pages/home/home_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProxyProvider<AuthViewModel, HomeViewModel>(
          create: (_) => HomeViewModel(authViewModel: null),
          update: (_, authViewModel, previous) => HomeViewModel(authViewModel: authViewModel),
        ),
      ],
      child: MaterialApp(
        title: 'My Apps',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.index,
        routes: {
          AppRoutes.index: (context) => const IndexPage(),
          AppRoutes.login: (context) => const LoginPage(),
          AppRoutes.register: (context) => const RegisterPage(),
          AppRoutes.home: (context) => const HomePage(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:instagram/bloc/home_bloc/home_bloc.dart';
import 'package:instagram/bloc/login_cubit/login_cubit.dart';
import 'package:instagram/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: Routes.onGeneratedRoutes,
        initialRoute: "/splash",
      ),
    );
  }
}
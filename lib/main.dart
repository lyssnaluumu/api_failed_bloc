import 'package:factory_api/features/api_bloc/bloc/api_bloc.dart';
import 'package:factory_api/responses_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API PAPI',
      home: BlocProvider(
        create: (context) => ApiBloc(),
        child: const ResponsesList(),
      ),
    );
  }
}

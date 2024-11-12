import 'package:awesome_app/core/injection/injection.dart';
import 'package:awesome_app/presentation/bloc/photos/photos_bloc.dart';
import 'package:awesome_app/presentation/screens/photos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (_) => sl<PhotosBloc>(), child: const PhotosPage()),
    );
  }
}

import 'package:awesome_app/core/injection/injection.dart';
import 'package:awesome_app/core/network/network_connectivity_service.dart';
import 'package:awesome_app/core/widgets/network_aware_widget.dart';
import 'package:awesome_app/core/widgets/offline_widget.dart';
import 'package:awesome_app/presentation/bloc/photos/photos_bloc.dart';
import 'package:awesome_app/presentation/screens/photos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NetworkConnectivityService _connectivityService =
      NetworkConnectivityService();

  @override
  void initState() {
    super.initState();
    _connectivityService.initialize();
  }

  @override
  void dispose() {
    _connectivityService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: NetworkAwareWidget(
          connectionStream: _connectivityService.connectionStatus,
          onlineChild: BlocProvider(
              create: (_) => sl<PhotosBloc>(), child: const PhotosPage()),
          offlineChild: OfflineWidget(
            onRetry: () async {
              final hasConnection =
                  await _connectivityService.checkConnection();
              if (hasConnection) {}
            },
          ),
        ),
      ),
    );
  }
}

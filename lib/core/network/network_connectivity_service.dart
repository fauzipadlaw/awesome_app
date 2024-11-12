import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkConnectivityService {
  static final NetworkConnectivityService _singleton =
      NetworkConnectivityService._internal();
  factory NetworkConnectivityService() => _singleton;
  NetworkConnectivityService._internal();

  final _connectivity = Connectivity();
  final _internetConnectionChecker = InternetConnection();

  final _connectionStatusController = StreamController<bool>.broadcast();

  Stream<bool> get connectionStatus => _connectionStatusController.stream;

  void initialize() {
    _connectivity.onConnectivityChanged.listen(_checkConnection);
    checkConnection();
  }

  Future<void> _checkConnection(List<ConnectivityResult> result) async {
    if (result.contains(ConnectivityResult.none)) {
      _connectionStatusController.add(false);
      return;
    }

    final hasInternet = await _internetConnectionChecker.hasInternetAccess;
    _connectionStatusController.add(hasInternet);
  }

  Future<bool> checkConnection() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      _connectionStatusController.add(false);
      return false;
    }

    final hasInternet = await _internetConnectionChecker.hasInternetAccess;
    _connectionStatusController.add(hasInternet);
    return hasInternet;
  }

  void dispose() {
    _connectionStatusController.close();
  }
}

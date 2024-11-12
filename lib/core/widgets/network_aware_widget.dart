import 'package:flutter/material.dart';

class NetworkAwareWidget extends StatelessWidget {
  final Widget onlineChild;
  final Widget offlineChild;
  final Stream<bool> connectionStream;

  const NetworkAwareWidget({
    super.key,
    required this.onlineChild,
    required this.offlineChild,
    required this.connectionStream,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: connectionStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.none) {
          return onlineChild;
        }

        return (snapshot.data ?? true) ? onlineChild : offlineChild;
      },
    );
  }
}

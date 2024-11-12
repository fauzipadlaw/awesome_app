import 'package:flutter/material.dart';

class ShareActionButton extends StatelessWidget {
  final void Function() share;
  const ShareActionButton({super.key, required this.share});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: share,
      child: const Icon(Icons.share),
    );
  }
}

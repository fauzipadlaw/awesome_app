import 'package:awesome_app/domain/entities/photo.dart';
import 'package:awesome_app/presentation/widgets/image_box.dart';
import 'package:flutter/material.dart';

class SliverAppBarWidget extends StatelessWidget {
  final Photo photo;
  final double expandedHeight;
  const SliverAppBarWidget(
      {super.key, required this.photo, this.expandedHeight = 300});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: expandedHeight,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: photo.id ?? 0,
          child: ImageBox(
            url: photo.src?.landscape ?? (photo.src?.original ?? ''),
          ),
        ),
      ),
    );
  }
}

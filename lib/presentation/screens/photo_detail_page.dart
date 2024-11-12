import 'package:awesome_app/presentation/widgets/info_card.dart';
import 'package:awesome_app/presentation/widgets/share_action_button.dart';
import 'package:awesome_app/presentation/widgets/sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../domain/entities/photo.dart';

class PhotoDetailPage extends StatelessWidget {
  final Photo photo;

  const PhotoDetailPage({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBarWidget(
            photo: photo,
          ),
          _buildPhotoDetails(),
        ],
      ),
      floatingActionButton: ShareActionButton(
        share: _sharePhoto,
      ),
    );
  }

  Widget _buildPhotoDetails() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoCard(
              title: 'Photographer',
              content: photo.photographer,
              icon: Icons.person,
            ),
            InfoCard(
              title: 'Photographer URL',
              content: photo.photographerUrl,
              icon: Icons.person,
            ),
            InfoCard(
              title: 'Dimensions',
              content: '${photo.width} x ${photo.height}',
              icon: Icons.aspect_ratio,
            ),
            InfoCard(
              title: 'AVG Color',
              content: photo.avgColor,
              icon: Icons.colorize,
            ),
            InfoCard(
              title: 'Description',
              content: photo.alt,
              icon: Icons.description,
            ),
            InfoCard(
              title: 'Original URL',
              content: photo.url,
              icon: Icons.link,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sharePhoto() async {
    await Share.share(
      'Check out this awesome photo by ${photo.photographer}: ${photo.url}',
    );
  }
}

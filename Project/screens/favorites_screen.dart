import 'package:flutter/material.dart';

import '../data/videos_data.dart';
import '../models/video_lessons.dart';
import './coursevideo_screen.dart'; 

class FavoriteVideoListScreen extends StatefulWidget {
  const FavoriteVideoListScreen({Key? key}) : super(key: key);

  @override
  _FavoriteVideoListScreenState createState() =>
      _FavoriteVideoListScreenState();
}

class _FavoriteVideoListScreenState extends State<FavoriteVideoListScreen> {
  void _onVideoTap(Videos video) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CourseVideosScreen(
          courseCategories: video.course,
          initialVideo: video.videoUrl,
        ),
      ),
    );
  }

  void _toggleFavorite(Videos video) {
    setState(() {
      bool wasFavorite = video.isFavorite;
      video.toggleFavorite();

      if (!video.isFavorite && wasFavorite) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Removed from favorites'),
              action: SnackBarAction(
                label: 'UNDO',
                onPressed: () {
                  setState(() {
                    video.toggleFavorite(); 
                  });
                },
              ),
              duration: const Duration(seconds: 3),
            ),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteVideos = videos.where((video) => video.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Videos'),
      ),
      body: favoriteVideos.isEmpty
          ? const Center(
              child: Text(
                'No favorite videos found.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: favoriteVideos.length,
              itemBuilder: (context, index) {
                final video = favoriteVideos[index];
                return VideoListItem(
                  video: video,
                  isPlaying: false,
                  onTap: () => _onVideoTap(video),
                  onFavoriteToggle: () => _toggleFavorite(video),
                );
              },
            ),
    );
  }
}

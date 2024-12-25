import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../data/videos_data.dart';
import '../models/courses.dart';
import '../models/video_lessons.dart';

class CourseVideosScreen extends StatefulWidget {
  const CourseVideosScreen({
    Key? key,
    required this.courseCategories,
    this.initialVideo,
  }) : super(key: key);

  final Courses courseCategories;
  final String? initialVideo;

  @override
  State<CourseVideosScreen> createState() => _CourseVideosScreenState();
}

class _CourseVideosScreenState extends State<CourseVideosScreen> {
  late YoutubePlayerController _controller;
  String currentVideoUrl = '';
  List<Videos> filteredVideos = [];

  @override
  void initState() {
    super.initState();

    // Filter videos by course label
    filteredVideos = videos
        .where((video) => video.course.label == widget.courseCategories.label)
        .toList();

    if (filteredVideos.isNotEmpty) {
      currentVideoUrl = widget.initialVideo ?? filteredVideos[0].videoUrl;
      _initializeController(currentVideoUrl);
    } else {
      debugPrint('This course has no videos available to play.');
    }
  }

  void _initializeController(String videoUrl) {
    final videoId = YoutubePlayerController.convertUrlToId(videoUrl);
    if (videoId != null) {
      _controller = YoutubePlayerController(
        params: const YoutubePlayerParams(
          mute: false,
          showControls: true,
          showFullscreenButton: true,
        ),
      );
      _controller.loadVideoById(
        videoId: videoId,
      );
    } else {
      debugPrint('Invalid initial video URL: $videoUrl');
    }
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  void _playVideo(String videoUrl) {
    final videoId = YoutubePlayerController.convertUrlToId(videoUrl);
    if (videoId != null) {
      setState(() {
        currentVideoUrl = videoUrl;
        _controller.loadVideoById(videoId: videoId);
      });
    } else {
      debugPrint('Invalid YouTube URL: $videoUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.courseCategories.label),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Main video player
          if (filteredVideos.isNotEmpty &&
              YoutubePlayerController.convertUrlToId(currentVideoUrl) != null)
            YoutubePlayer(
              controller: _controller,
              aspectRatio: 16 / 9,
            )
          else
            const Center(child: CircularProgressIndicator()),

          const SizedBox(height: 10),

          filteredVideos.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: filteredVideos.length,
                    itemBuilder: (context, index) {
                      final video = filteredVideos[index];
                      return VideoListItem(
                        video: video,
                        isPlaying: video.videoUrl == currentVideoUrl,
                        onTap: () => _playVideo(video.videoUrl),
                        onFavoriteToggle: () => setState(() {
                          video.toggleFavorite();
                        }),
                      );
                    },
                  ),
                )
              : const Expanded(
                  child: Center(
                    child: Text(
                      'No videos available for this course.',
                      style: TextStyle(fontSize: 16, color: Colors.white38),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class VideoListItem extends StatelessWidget {
  const VideoListItem({
    super.key,
    required this.video,
    required this.isPlaying,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  final Videos video;
  final bool isPlaying;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isPlaying ? Colors.black87 : null,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          color: Colors.grey.shade300,
          child: const Icon(Icons.video_library),
        ),
        title: Text(video.title),
        subtitle: Text(video.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                video.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: video.isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: onFavoriteToggle, // Toggle favorite when pressed
            ),
            IconButton(
              icon: isPlaying
                  ? const Icon(Icons.pause)
                  : const Icon(Icons.play_arrow),
              color: Colors.white,
              onPressed: onTap,
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}

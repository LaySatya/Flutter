import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../data/videos_data.dart';
import '../models/courses.dart';
import '../models/video_lessons.dart';

class CourseVideosScreen extends StatefulWidget {
  const CourseVideosScreen({
    Key? key,
    required this.courseCategories,
  }) : super(key: key);

  final Courses courseCategories;

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

    // filter by category course
    filteredVideos = videos
        .where((video) => video.course.label == widget.courseCategories.label)
        .toList();

    if (filteredVideos.isNotEmpty) {
      currentVideoUrl = videos[0].videoUrl;
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
          videoId: videoId); // Load the video after initializing
    } else {
      debugPrint('Invalid initial video URL: $videoUrl');
    }
  }

  @override
  void dispose() {
    _controller.close(); // Properly clean up resources
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
            const Center(
                // child: Padding(
                //   padding: EdgeInsets.all(16.0),
                //   child: Text(
                //     'No video available to play.',
                //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                //   ),
                // ),
                ),

          const SizedBox(height: 10),

          filteredVideos.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: videos.length,
                    itemBuilder: (context, index) {
                      final video = videos[index];
                      return VideoListItem(
                        video: video,
                        isPlaying: video.videoUrl == currentVideoUrl,
                        onTap: () => _playVideo(video.videoUrl),
                      );
                    },
                  ),
                )
              :
              // const SizedBox(height: 20),
              const Expanded(
                  child: Center(
                    child: Text(
                      'No videos available for this course.',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.white38),
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
  });

  final Videos video;
  final bool isPlaying;
  final VoidCallback onTap;

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
        trailing: isPlaying
            ? const Icon(Icons.pause, color: Colors.white)
            : const Icon(Icons.play_arrow, color: Colors.white),
        title: Text(video.title),
        subtitle: Text(video.description),
        onTap: onTap,
      ),
    );
  }
}

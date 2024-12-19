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

  @override
  void initState() {
    super.initState();
    if (videos.isNotEmpty) {
      currentVideoUrl = videos[0].videoUrl;
      _initializeController(currentVideoUrl);
    } else {
      debugPrint('No videos available to play.');
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
    return WillPopScope(
      onWillPop: () async {
        // Ensure the controller is initialized before checking isPlaying
        if (_controller != null) {
          _controller.pauseVideo(); // Pause the video before navigating back
        }
        return true; // Allow navigation
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.courseCategories.label),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // Main video player
            if (videos.isNotEmpty &&
                YoutubePlayerController.convertUrlToId(currentVideoUrl) != null)
              YoutubePlayer(
                controller: _controller,
                aspectRatio: 16 / 9,
              )
            else
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'No video available to play.',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            const SizedBox(height: 10),
            // Scrollable list of video episodes
            Expanded(
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
            ),
          ],
        ),
      ),
    );
  }
}



class VideoListItem extends StatelessWidget {
  const VideoListItem({
    Key? key,
    required this.video,
    required this.isPlaying,
    required this.onTap,
  }) : super(key: key);

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

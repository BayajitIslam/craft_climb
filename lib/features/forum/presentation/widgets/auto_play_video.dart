import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AutoPlayVideo extends StatefulWidget {
  final String? networkUrl;
  final File? localFile;
  final double height;

  const AutoPlayVideo.network({
    super.key,
    required String url,
    this.height = 300,
  })  : networkUrl = url,
        localFile = null;

  const AutoPlayVideo.file({
    super.key,
    required File file,
    this.height = 300,
  })  : localFile = file,
        networkUrl = null;

  @override
  State<AutoPlayVideo> createState() => _AutoPlayVideoState();
}

class _AutoPlayVideoState extends State<AutoPlayVideo> {
  late final VideoPlayerController _controller;
  late final Key _detectorKey;
  bool _initialized = false;
  bool _isMuted = true;

  @override
  void initState() {
    super.initState();
    // unique key per instance so two identical URLs don't conflict
    _detectorKey = UniqueKey();

    _controller = widget.localFile != null
        ? VideoPlayerController.file(widget.localFile!)
        : VideoPlayerController.networkUrl(Uri.parse(widget.networkUrl!));

    _controller
      ..setVolume(0)
      ..setLooping(true)
      ..initialize().then((_) {
        if (mounted) setState(() => _initialized = true);
      });
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0 : 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: _detectorKey,
      onVisibilityChanged: (info) {
        if (!mounted) return;
        // auto-play when at least 60% of the video is on screen
        info.visibleFraction >= 0.6
            ? _controller.play()
            : _controller.pause();
      },
      child: SizedBox(
        height: widget.height,
        width: double.infinity,
        child: _initialized
            ? Stack(
                fit: StackFit.expand,
                children: [
                  // video scaled to fill the cell
                  FittedBox(
                    fit: BoxFit.cover,
                    clipBehavior: Clip.hardEdge,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  ),

                  // thin scrub bar at the very bottom
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: VideoProgressIndicator(
                      _controller,
                      allowScrubbing: true,
                      padding: EdgeInsets.zero,
                      colors: const VideoProgressColors(
                        playedColor: Colors.white,
                        bufferedColor: Colors.white30,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),

                  // mute / unmute button
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: _toggleMute,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _isMuted ? Icons.volume_off : Icons.volume_up,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            // loading skeleton while the controller initialises
            : Container(
                color: const Color(0xFF1A1A2E),
                child: const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white54,
                  ),
                ),
              ),
      ),
    );
  }
}
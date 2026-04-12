import 'dart:io';

class PostMediaItem {
  final String url;
  final File? localFile;
  final bool isVideo;
  final String? duration;

  const PostMediaItem({
    required this.url,
    this.localFile,
    required this.isVideo,
    this.duration,
  });

  bool get isLocal => localFile != null;

  // Build from a network images list
  static List<PostMediaItem> fromImageList(List<dynamic> images) => images
      .map((url) => PostMediaItem(url: url as String, isVideo: false))
      .toList();

  // Build from a mixed network media list
  static List<PostMediaItem> fromMediaList(List<dynamic> media) =>
      media.map((m) {
        final map = m as Map<String, dynamic>;
        return PostMediaItem(
          url: map['url'] as String? ?? '',
          isVideo: map['isVideo'] as bool? ?? false,
          duration: map['duration'] as String?,
        );
      }).toList();

  // Build a single video item from a network video post
  static PostMediaItem fromVideoPost(Map<String, dynamic> post) =>
      PostMediaItem(
        url: post['thumbnail'] as String? ?? '',
        isVideo: true,
        duration: post['duration'] as String?,
      );

  // Build from local files stored after user creates a post
  static List<PostMediaItem> fromLocalMedia(List<dynamic> localMedia) =>
      localMedia.map((m) {
        final map = m as Map<String, dynamic>;
        return PostMediaItem(
          url: '',
          localFile: map['file'] as File,
          isVideo: map['isVideo'] as bool? ?? false,
        );
      }).toList();

  // Universal resolver — handles any post type including locally created posts
  static List<PostMediaItem> fromPost(Map<String, dynamic> post) {
    if (post.containsKey('localMedia')) {
      return fromLocalMedia(post['localMedia'] as List);
    }
    switch (post['type'] as String? ?? 'image') {
      case 'video':
        return [fromVideoPost(post)];
      case 'mixed':
        return fromMediaList(post['media'] as List);
      case 'text':
        return [];
      default:
        return fromImageList(post['images'] as List? ?? []);
    }
  }
}
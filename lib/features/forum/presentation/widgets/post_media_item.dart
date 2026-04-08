class PostMediaItem {
  final String url;
  final bool isVideo;
  final String? duration;

  const PostMediaItem({
    required this.url,
    required this.isVideo,
    this.duration,
  });

  /// Build from a raw 'images' list (all photos)
  static List<PostMediaItem> fromImageList(List<dynamic> images) => images
      .map((url) => PostMediaItem(url: url as String, isVideo: false))
      .toList();

  /// Build from a raw 'media' list (mixed photo+video maps)
  static List<PostMediaItem> fromMediaList(List<dynamic> media) => media
      .map(
        (m) => PostMediaItem(
          url: (m as Map<String, dynamic>)['url'] as String,
          isVideo: m['isVideo'] as bool? ?? false,
          duration: m['duration'] as String?,
        ),
      )
      .toList();

  /// Build a single video item from a post map
  static PostMediaItem fromVideoPost(Map<String, dynamic> post) =>
      PostMediaItem(
        url: post['thumbnail'] as String? ?? '',
        isVideo: true,
        duration: post['duration'] as String?,
      );
}

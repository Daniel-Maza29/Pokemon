class VideoPost {
  final String caption;
  final String videoUrl;
  final int likes;
  final int view;

  VideoPost({
    required this.caption, 
    required this.videoUrl, 
    this.likes= 0, 
    this.view= 0

    
    });

  static List<VideoPost> map(List<dynamic> list) => 
    list.map((video) => VideoPost(
      caption: video['caption'],
      videoUrl: video['videoUrl'],
      likes: video['likes'] ?? 0,
      view: video['view'] ?? 0,
    )).toList();
}

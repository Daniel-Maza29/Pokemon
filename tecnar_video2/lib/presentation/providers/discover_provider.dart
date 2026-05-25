import 'package:flutter/material.dart';
import 'package:tecnar_video2/domain/entities/video_post.dart';
import 'package:tecnar_video2/infrastucture/local_video_model.dart';


class DiscoverProvider extends ChangeNotifier {

  bool initialLoanding = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {

final List<VideoPost> newVideos = [].map(
      (video) => LocalVideoModel.fromJson(video as Map<String, dynamic>).toVideoPostEntity(),
    ).toList();

    videos.addAll(newVideos);
    initialLoanding = false;

    notifyListeners();
  }
}
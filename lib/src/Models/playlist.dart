class PlayList {
  final String id;

  final String title;
  final String description;
  final String thumbnailUrl;

  PlayList({
    this.id,
    this.title,
    this.description,
    this.thumbnailUrl,
  });

  factory PlayList.fromMap(Map<String, dynamic> snippet) {
    return PlayList(
      id: snippet['id'],
      title: snippet['title'],
      description: snippet['description'],
      thumbnailUrl: snippet['thumbnails']['high']['url'],
    );
  }
}

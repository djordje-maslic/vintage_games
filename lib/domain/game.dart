
class Game {
  final int id;
  final String title;
  final String thumbnail;

  Game({
    required this.id,
    required this.title,
    required this.thumbnail,
  });

  factory Game.fromJson(dynamic jeson) {
    return Game(
      id: jeson['id'] as int,
      title: jeson['title'] as String,
      thumbnail: jeson['thumbnail'] as String,
    );
  }

  @override
  String toString() {
    return 'Game(title:$title, id:$id, thumbnail:$thumbnail)';
  }

  @override
  int get hashCode => Object.hash(id, thumbnail, title);

  @override
  bool operator ==(Object o) {
    if(identical(this, o))return true;
    return o is Game &&
        o.id == id &&
        o.thumbnail == thumbnail &&
        o.title == title;
  }
}

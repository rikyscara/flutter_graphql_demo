class Film {
  final String id;
  final String title;
  final String director;
  final String releaseDate;

  const Film({
    required this.id,
    required this.title,
    this.director = '',
    this.releaseDate = '',
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      id: json['id'],
      title: json['title'],
      director: json['director'],
      releaseDate: json['releaseDate'],
    );
  }
}

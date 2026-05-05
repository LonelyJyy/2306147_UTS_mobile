class Quest {
  final String id;
  final String title;
  final String rank;
  final String reward;
  final String image;
  final String desc;
  bool isTaken;

  Quest({
    required this.id,
    required this.title,
    required this.rank,
    required this.reward,
    required this.image,
    required this.desc,
    this.isTaken = false,
  });
}

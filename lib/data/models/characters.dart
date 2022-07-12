class Character {
  late int charId;
  late String name;
  late String nickName;
  late String image;
  late List<dynamic> jobs;
  late String status;
  late List<dynamic> appearanceOfSeasons;
  late String actorName;
  late String categorySeries;
  late List<dynamic> betterCallSaulApp;

  Character.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    nickName = json['nickname'];
    image = json['img'];
    jobs = json['occupation'];
    status = json['status'];
    appearanceOfSeasons = json['appearance'];
    actorName = json['portrayed'];
    categorySeries = json['category'];
    betterCallSaulApp = json['better_call_saul_appearance'];
  }
}

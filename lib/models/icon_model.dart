class IconModel {
  String icon;
  String title;
  IconModel({
    required this.icon,
    required this.title,
  });
  static List<IconModel> icons = [
    IconModel(
      icon: "assets/icons/Icon_1.png",
      title: "Discover",
    ),
    IconModel(
      icon: "assets/icons/Icon_2.png",
      title: "Arbitrary",
    ),
    IconModel(
      icon: "assets/icons/Icon_3.png",
      title: "Author Nearby",
    ),
    IconModel(
      icon: "assets/icons/Icon_4.png",
      title: "WorldWide",
    ),
    IconModel(
      icon: "assets/icons/Icon_5.png",
      title: "Audio Book",
    ),
    IconModel(
      icon: "assets/icons/Icon_6.png",
      title: "Internet",
    ),
    IconModel(
      icon: "assets/icons/Icon_7.png",
      title: "Wide Access",
    ),
  ];
}

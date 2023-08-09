class Tea {
  String name;
  String price;
  String imgPath;
  String stars;

  Tea(
      {required this.name,
      required this.price,
      required this.imgPath,
      required this.stars});

  String get _name => name;
  String get _price => price;
  String get _imgPath => imgPath;
  String get _stars => stars;
}

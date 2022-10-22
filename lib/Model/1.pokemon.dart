class Pokemon {
  String? name;
  String? url;
  String? imgUri;
  int? weight;
  int? height;
  List<String> types = [];

  Pokemon({
    this.name,
    this.url,
  });

  @override
  String toString() {
    return "$name, $url";
  }
}

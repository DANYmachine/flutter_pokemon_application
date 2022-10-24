class Pokemon {
  String? name;
  String? url;
  String? imgUri;
  String? logoUri;
  int? weight;
  int? height;
  List<String> types = [];

  Pokemon({
    this.name,
    this.url,
    this.logoUri,
  });

  @override
  String toString() {
    return "$name, $url";
  }
}

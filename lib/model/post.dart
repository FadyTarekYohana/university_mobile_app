import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  String? alphaTwoCode;
  String? name;
  List<String>? webPages;
  dynamic stateProvince;
  List<String>? domains;
  String? country;

  Post(
      {this.alphaTwoCode,
      this.name,
      this.webPages,
      this.stateProvince,
      this.domains,
      this.country});

  Post.fromJson(Map<String, dynamic> json) {
    alphaTwoCode = json["alpha_two_code"];
    name = json["name"];
    webPages =
        json["web_pages"] == null ? null : List<String>.from(json["web_pages"]);
    stateProvince = json["state-province"];
    domains =
        json["domains"] == null ? null : List<String>.from(json["domains"]);
    country = json["country"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["alpha_two_code"] = alphaTwoCode;
    _data["name"] = name;
    if (webPages != null) {
      _data["web_pages"] = webPages;
    }
    _data["state-province"] = stateProvince;
    if (domains != null) {
      _data["domains"] = domains;
    }
    _data["country"] = country;
    return _data;
  }
}

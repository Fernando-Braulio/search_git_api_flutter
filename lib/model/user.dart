class User {
  final String name;
  final String avatar_url;
  final String location;
  final int public_repos;
  final int followers;
  final int following;
  final String created_at;

  User(
      {this.name,
      this.avatar_url,
      this.location,
      this.public_repos,
      this.followers,
      this.following,
      this.created_at});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      avatar_url: json['avatar_url'],
      location: json['location'],
      public_repos: json['public_repos'],
      followers: json['followers'],
      following: json['following'],
      created_at: json['created_at'],
    );
  }
}

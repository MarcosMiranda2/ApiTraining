class Token {
  final String access;
  final String type;
  final String refresh;

  Token({required this.access, required this.type, required this.refresh});

  factory Token.fromJson(Map<String, dynamic> json) => Token(
      access: json['access_token'],
      type: json['token_type'],
      refresh: json['refresh_token']);

  Map<String, dynamic> toJson() => {
        'access_token': access,
        'token_type': type,
        'refresh_token': refresh,
      };
}

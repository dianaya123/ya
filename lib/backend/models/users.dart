class users {
  final String nomor_induk;
  final String password;
  users({required this.nomor_induk, required this.password});
  factory users.fromJson(Map<String, dynamic> json) {
    return users(
      nomor_induk: json['nomor_induk'],
      password: json['password'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'nomor_induk': nomor_induk,
      'password': password,
    };
  }
}

class Users {
  final int status;
  final int id;
  final int role;
  final String name;
  final String nomorInduk;
  final String? email;
  final String? emailVerified;
  final String dateCreated;
  final String dateEdited;
  final String token;

  Users({
    required this.status,
    required this.id,
    required this.role,
    required this.name,
    required this.nomorInduk,
    this.email,
    this.emailVerified,
    required this.dateCreated,
    required this.dateEdited,
    required this.token,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      status: json['status'],
      id: json['user']['id'],
      role: json['user']['role'],
      name: json['user']['name'],
      nomorInduk: json['user']['nomor_induk'],
      email: json['user']['email'],
      emailVerified: json['user']['email_verified_at'],
      dateCreated: json['user']['created_at'],
      dateEdited: json['user']['updated_at'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "user": {
        "id": id,
        "role": role,
        "name": name,
        "nomor_induk": nomorInduk,
        "email": email,
        "email_verified_at": emailVerified,
        "created_at": dateCreated,
        "updated_at": dateEdited,
      },
      "token": token,
    };
  }
}

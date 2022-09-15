class User {
  late String id;
  late String name;
  late String cpf;
  late String email;
  late String password;
  late String confirmPassword;
  late String country;

  get user => User;

  User({
    required this.cpf,
    required this.email,
    required this.password,
    required this.name,
    required this.confirmPassword,
    required this.id,
    required this.country,
  });
}

class SignUpReq {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpReq({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}

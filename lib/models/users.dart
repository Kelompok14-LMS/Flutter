import 'mentees.dart';

class Users {
  final String id;
  final String email;
  final String password;
  final String createdAt;
  final String updatedAt;

  Users({
    this.id = '',
    required this.email,
    required this.password,
    this.createdAt = '',
    this.updatedAt = '',
  });

  //Login
   Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  //Registrasi
  Map<String, dynamic> registerToMap(Mentees mentee) {
    return {
      'fullname' : mentee.fullName,
      'phone' : mentee.phone,
      'email': email,
      'password': password,
    };
  }
}

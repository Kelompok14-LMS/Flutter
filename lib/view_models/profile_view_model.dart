import 'package:flutter/material.dart';

class ProfileViewModel with ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final nomorTelpController = TextEditingController();
  final tanggalLahirController = TextEditingController();
  final alamatController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    nomorTelpController.dispose();
    tanggalLahirController.dispose();
    alamatController.dispose();
    super.dispose();
  }
}

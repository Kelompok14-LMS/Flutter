import 'dart:ffi';

import 'package:edu_world/utils/validator.dart';
import 'package:edu_world/view_models/profile_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../utils/constant.dart';
import '../../view_models/auth_view_model.dart';
import '../login/login_screen.dart';
import '../main_view.dart';

class EditProfileScreen extends StatefulWidget {
  final int index;
  const EditProfileScreen({super.key, required this.index});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> with Validator {
  @override
  void initState() {
    final profileProvider =
        Provider.of<ProfileViewModel>(context, listen: false);
    profileProvider.nameController = TextEditingController(
        text: profileProvider.mentees[widget.index].fullname);
    profileProvider.nomorTelpController = TextEditingController(
        text: profileProvider.mentees[widget.index].phone);
    profileProvider.tanggalLahirController = TextEditingController(
        text: profileProvider.mentees[widget.index].birthDate);
    super.initState();
  }

  final GlobalKey<FormState> keyForm = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final profileProvider =
        Provider.of<ProfileViewModel>(context, listen: false);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: MyColor.primary,
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                final viewModel = context.read<AuthViewModel>();
                final result = await viewModel.logout();
                if (mounted) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(result.toString().toString())));
                }
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(
                  Colors.transparent,
                ),
              ),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  'Keluar',
                  style: GoogleFonts.roboto(
                      color: MyColor.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.logout,
                  color: MyColor.primary,
                  size: 24,
                ),
              ]),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Consumer<ProfileViewModel>(
              builder: (context, value, child) => value
                          .mentees[widget.index].profilePicture !=
                      null
                  ? Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          scale: 1.1,
                          image: NetworkImage(
                              value.mentees[widget.index].profilePicture),
                        ),
                        shape: BoxShape.circle,
                      ),
                      height: 210,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 157,
                            top: 165,
                            right: 157,
                            child: InkWell(
                              child: Container(
                                height: 40,
                                width: 118,
                                decoration: BoxDecoration(
                                  color: MyColor.primaryLogo,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Text(
                                    'Edit Foto',
                                    style: GoogleFonts.roboto(
                                        color: MyColor.primary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              onTap: () {
                                profileProvider.ambilFoto(
                                    context, value.mentees[widget.index].id);
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          scale: 1.1,
                          image: ExactAssetImage('assets/images/Ellipse 6.png'),
                        ),
                        shape: BoxShape.circle,
                      ),
                      height: 210,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 157,
                            top: 165,
                            right: 157,
                            child: InkWell(
                              child: Container(
                                height: 40,
                                width: 118,
                                decoration: BoxDecoration(
                                  color: MyColor.primaryLogo,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Text(
                                    'Edit Foto',
                                    style: GoogleFonts.roboto(
                                        color: MyColor.primary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              onTap: () {
                                profileProvider.ambilFoto(
                                    context, value.mentees[widget.index].id);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: keyForm,
              child: Padding(
                padding: const EdgeInsets.only(right: 58, left: 58),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 48,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          shape: BoxShape.rectangle,
                          boxShadow: const [
                            BoxShadow(
                              color: MyColor.primaryLogo,
                              spreadRadius: 1,
                            )
                          ]),
                      child: Center(
                        child: Text(
                          profileProvider.mentees[widget.index].email,
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Nama Lengkap',
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              color: MyColor.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: profileProvider.nameController,
                      decoration: InputDecoration(
                        hintText: 'Masukan Nama Lengkap',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: validateForm,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Nomor Ponsel',
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              color: MyColor.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: profileProvider.nomorTelpController,
                      decoration: InputDecoration(
                        hintText: 'Masukan Nomor Ponsel',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: validateForm,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Tanggal Lahir',
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              color: MyColor.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: profileProvider.tanggalLahirController,
                      decoration: InputDecoration(
                        hintText: 'Masukan Tanggal Lahir',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: validateForm,
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    InkWell(
                      onTap: () {
                        if (keyForm.currentState!.validate()) {
                          keyForm.currentState!.save();
                          profileProvider.editProfile(context,
                              profileProvider.mentees[widget.index].id);
                          Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const MainScreen(),
                              ),
                              ((route) => false));
                        }
                      },
                      child: Container(
                        width: 300,
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: MyColor.primaryLogo),
                        child: Center(
                          child: Text(
                            'Simpan',
                            style: GoogleFonts.roboto(
                                color: MyColor.primary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

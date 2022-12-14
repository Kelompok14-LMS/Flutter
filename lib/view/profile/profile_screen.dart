import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/profile/edit_profile_screen.dart';
import 'package:edu_world/view_models/profile_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../view_models/auth_view_model.dart';
import '../login/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    Provider.of<ProfileViewModel>(context, listen: false).getProfile(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      body: Consumer<ProfileViewModel>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.mentees.isEmpty ? 0 : value.mentees.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                value.mentees != null
                    ? Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            scale: 1.1,
                            image: NetworkImage(
                                value.mentees[index].profilePicture),
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
                                      'Ganti Foto',
                                      style: GoogleFonts.roboto(
                                          color: MyColor.primary,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Provider.of<ProfileViewModel>(context,
                                          listen: false)
                                      .ambilFoto(
                                          context, value.mentees[index].id);
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
                            image:
                                ExactAssetImage('assets/images/Ellipse 6.png'),
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
                                      'Ganti Foto',
                                      style: GoogleFonts.roboto(
                                          color: MyColor.primary,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Provider.of<ProfileViewModel>(context,
                                          listen: false)
                                      .ambilFoto(
                                          context, value.mentees[index].id);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
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
                          value.mentees[index].email,
                          style: GoogleFonts.roboto(
                              fontSize: 18, color: Colors.black38),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 60, left: 60),
                      child: Column(
                        children: [
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
                          Container(
                            height: 48,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              shape: BoxShape.rectangle,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  value.mentees[index].fullname,
                                  style: GoogleFonts.roboto(
                                      fontSize: 16, color: MyColor.primary),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
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
                          Container(
                            height: 48,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              shape: BoxShape.rectangle,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  value.mentees[index].phone,
                                  style: GoogleFonts.roboto(
                                      fontSize: 16, color: MyColor.primary),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
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
                          Container(
                            height: 48,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              shape: BoxShape.rectangle,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  value.mentees[index].birthDate,
                                  style: GoogleFonts.roboto(
                                      fontSize: 16, color: MyColor.primary),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => EditProfileScreen(
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 48,
                        width: 300,
                        decoration: BoxDecoration(
                          color: MyColor.primaryLogo,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Ubah',
                            style: GoogleFonts.roboto(
                                color: MyColor.primary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

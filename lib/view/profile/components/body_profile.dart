import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../utils/constant.dart';
import '../../../view_models/profile_view_model.dart';
import '../edit_profile_screen.dart';

Widget buildProfilePage(context) {
  final profileViewModel =
      Provider.of<ProfileViewModel>(context, listen: false);
  return ListView(
    children: <Widget>[
      Consumer<ProfileViewModel>(
        builder: (context, value, child) => CachedNetworkImage(
          imageUrl: value.mentees!.data!.profilePicture!.isEmpty
              ? value.imageProfileDefault
              : value.mentees!.data!.profilePicture!,
          imageBuilder: (context, imageProvider) => Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(
              backgroundColor: MyColor.primaryLogo,
              color: Colors.white,
            ),
          ),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
        ),
      ),
      Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
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
              ],
            ),
            child: Center(
              child: Consumer<ProfileViewModel>(
                builder: (context, value, child) => Text(
                  profileViewModel.mentees!.data!.email!,
                  style:
                      GoogleFonts.roboto(fontSize: 18, color: Colors.black38),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 60, left: 60),
            child: Column(
              children: <Widget>[
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
                      Consumer<ProfileViewModel>(
                        builder: (context, value, child) => Text(
                          profileViewModel.mentees!.data!.fullname!,
                          style: GoogleFonts.roboto(
                              fontSize: 16, color: MyColor.primary),
                        ),
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
                      Consumer<ProfileViewModel>(
                        builder: (context, value, child) => Text(
                          profileViewModel.mentees!.data!.phone!,
                          style: GoogleFonts.roboto(
                              fontSize: 16, color: MyColor.primary),
                        ),
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
                      Consumer<ProfileViewModel>(
                        builder: (context, value, child) => Text(
                          profileViewModel.mentees!.data!.birthDate!,
                          style: GoogleFonts.roboto(
                              fontSize: 16, color: MyColor.primary),
                        ),
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
                  builder: (context) => const EditProfileScreen(),
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
                      color: MyColor.primary, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      )
    ],
  );
}

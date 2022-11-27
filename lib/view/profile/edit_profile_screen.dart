import 'package:edu_world/utils/validator.dart';
import 'package:edu_world/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constant.dart';
import '../main_view.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> with Validator {
  final GlobalKey<FormState> keyForm = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final profileProvider =
        Provider.of<ProfileViewModel>(context, listen: false);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          children: <Widget>[
            SizedBox(
              width: media.width,
              height: media.height * 0.30,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: media.width,
                    height: media.height * 0.25,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Ellipse 4.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Positioned(
                    left: 60,
                    right: 60,
                    top: media.height * 0.10,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      height: 130,
                      width: double.infinity,
                      child: Center(
                          child: Image.asset('assets/images/Ellipse 5.png')),
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: keyForm,
              child: Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: Column(
                  children: <Widget>[
                    const Text(
                      'Zhai Purnomo',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: profileProvider.nameController,
                      decoration: InputDecoration(
                        label: const Text('Nama kamu'),
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      validator: validateForm,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: profileProvider.emailController,
                      decoration: InputDecoration(
                        label: const Text('Email'),
                        prefixIcon: const Icon(
                          Icons.alternate_email,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      validator: validateForm,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: profileProvider.nomorTelpController,
                      decoration: InputDecoration(
                        label: const Text('Nomor Telepon'),
                        prefixIcon: const Icon(
                          Icons.call,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      validator: validateForm,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.datetime,
                      controller: profileProvider.tanggalLahirController,
                      decoration: InputDecoration(
                        label: const Text('Tanggal Lahir'),
                        prefixIcon: const Icon(
                          Icons.calendar_today,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      validator: validateForm,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      controller: profileProvider.alamatController,
                      decoration: InputDecoration(
                        label: const Text('Alamat'),
                        prefixIcon: const Icon(
                          Icons.map,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      validator: validateForm,
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfileScreen(),
                            ));
                      },
                      child: Container(
                        width: 373,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: MyColor.danger,
                        ),
                        child: const Center(
                          child: Text(
                            'Reset Password',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        if (keyForm.currentState!.validate()) {
                          keyForm.currentState!.save();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainScreen(),
                              ),
                              ((route) => false));
                        }
                      },
                      child: Container(
                        width: 373,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: MyColor.primary,
                        ),
                        child: const Center(
                          child: Text(
                            'Simpan',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

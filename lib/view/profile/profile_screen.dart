import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/auth_view_model.dart';
import '../login/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            child: SizedBox(
              width: media.width,
              height: media.height * 0.35,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: media.width,
                    height: media.height * 0.31,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Ellipse 4.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Positioned(
                    left: 60,
                    right: 60,
                    top: media.height * 0.15,
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
          ),
          Column(
            children: <Widget>[
              const Text(
                'Zhai Purnomo',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 15,
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
                  height: 40,
                  width: 118,
                  decoration: BoxDecoration(
                    color: MyColor.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(17),
                child: Column(children: [
                  InkWell(
                    child: Row(
                      children: const <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.library_books),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'My Course',
                          style: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const CourseScreen(),
                      //     ));
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 43, top: 5, right: 20),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    child: Row(
                      children: const <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.info_outline),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'About',
                          style: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 43, top: 5, right: 20),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    child: Row(
                      children: const <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.logout),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ],
                    ),
                    onTap: () async {
                      final viewModel = context.read<AuthViewModel>();
                      final result = await viewModel.logout();
                      if (mounted) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                            (route) => false);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(result.toString().toString())));
                      }
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 43, top: 5, right: 20),
                    child: Divider(
                      thickness: 1,
                    ),
                  )
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/profile/components/body_profile.dart';
import 'package:edu_world/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../view_models/auth_view_model.dart';
import '../login/login_screen.dart';
import 'components/empty_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Provider.of<ProfileViewModel>(context, listen: false)
            .getProfile(context);
      },
    );
    super.didChangeDependencies();
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
        builder: (context, value, child) {
          if (value.profileState == ProfileState.loading) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: MyColor.primaryLogo,
                color: Colors.white,
              ),
            );
          } else if (value.profileState == ProfileState.loaded) {
            return buildProfilePage(context);
          } else if (value.profileState == ProfileState.error) {
            return showAtEmptyData();
          } else {
            return showAtEmptyData();
          }
        },
      ),
    );
  }
}

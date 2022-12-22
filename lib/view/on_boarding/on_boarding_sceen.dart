import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/onboarding_view_model.dart';
import '../components/roboto_text.dart';
import '../login/login_screen.dart';
import 'components/slider_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  void _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewMdoelOnboarding =
        Provider.of<OnBoardingViewModel>(context, listen: false);
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: viewMdoelOnboarding.pageOnBoarding.length,
            scrollDirection: Axis.horizontal,
            controller: _controller,
            onPageChanged: _onChanged,
            itemBuilder: (context, index) {
              final image = viewMdoelOnboarding.pageOnBoarding[index].image;
              final desc = viewMdoelOnboarding.pageOnBoarding[index].desc;
              final diffDesc =
                  viewMdoelOnboarding.pageOnBoarding[index].diffDesc;
              return SliderPage(
                image: image,
                desc: desc,
                diffDesc: diffDesc,
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      viewMdoelOnboarding.pageOnBoarding.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: (index == _currentPage) ? 10 : 8,
                      width: (index == _currentPage) ? 10 : 8,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: (index == _currentPage)
                            ? Colors.black
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 16, right: 16, top: 36, bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        child: _currentPage ==
                                viewMdoelOnboarding.pageOnBoarding.length - 3
                            ? null
                            : TextButton(
                                onPressed: () {
                                  _controller.previousPage(
                                    duration: const Duration(milliseconds: 800),
                                    curve: Curves.easeInOutQuint,
                                  );
                                },
                                child: const RobotoText(
                                  text: 'Kembali',
                                  fontSize: 22,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        child: _currentPage ==
                                viewMdoelOnboarding.pageOnBoarding.length - 1
                            ? TextButton(
                                onPressed: () async {
                                  await context
                                      .read<OnBoardingViewModel>()
                                      .setOnBoarding();

                                  if (mounted) {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen(),
                                        ),
                                        (route) => false);
                                  }
                                },
                                child: const RobotoText(
                                  text: 'Ayo Mulai!',
                                  fontSize: 22,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            : TextButton(
                                onPressed: () {
                                  _controller.nextPage(
                                    duration: const Duration(milliseconds: 800),
                                    curve: Curves.easeInOutQuint,
                                  );
                                },
                                child: const RobotoText(
                                  text: 'Selanjutnya',
                                  fontSize: 22,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

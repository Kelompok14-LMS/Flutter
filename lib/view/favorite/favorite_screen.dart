import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/user_course/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SearchBarUserCourse(titleSearch: 'Cari di Ulasan'),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: SizedBox(
                width: 380,
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://images.unsplash.com/photo-1523800503107-5bc3ba2a6f81?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',
                      height: 120,
                      width: 120,
                      fit: BoxFit.fill,
                    ),
                    // Container(
                    //   height: 120,
                    //   width: 120,
                    //   decoration: BoxDecoration(border: Border.all()),
                    // ),
                    const SizedBox(
                      width: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: SizedBox(
                        height: double.maxFinite,
                        width: 228,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Back End Fundamental',
                                style: MyColor().reviewCourseTextStyle),
                            const SizedBox(
                              height: 8,
                            ),
                            Text('Samantha Woo',
                                style: MyColor().reviewCourseSubTextStyle),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(),
                                SizedBox(
                                  width: 120,
                                  height: 32,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showBottomRating(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: MyColor.primaryLogo,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    child: Text(
                                      'Beri Ulasan',
                                      style: MyColor().judulCourse,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showBottomRating(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SizedBox(
          height: 692,
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close_rounded,
                      color: Colors.grey,
                      size: 40,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1498050108023-c5249f4df085?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1744&q=80',
                        height: 160,
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text('Back End Funcamental', style: MyColor().loginField),
                    Text('by Samantha Woo',
                        style: MyColor().reviewCourseSubTextStyleRating),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar.builder(
                            itemSize: 60,
                            unratedColor: const Color(0xFFD8D8D8),
                            itemBuilder: (context, index) {
                              return const Icon(
                                Icons.star_rounded,
                                color: MyColor.primaryLogo,
                              );
                            },
                            onRatingUpdate: (_) {}),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text('Mengapa kamu memberikan jumlah tersebut?',
                        style: MyColor().reviewCourseSubTextStyleRating),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: MyColor.primary),
                      decoration: InputDecoration(
                        hintText: 'Tulis Ulasanmu di sini...',
                        hintStyle: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF8896A7)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: MyColor.primaryLogo),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: MyColor.primaryLogo),
                        ),
                      ),
                      maxLines: 8,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 130,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColor.primaryLogo,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Kirim Ulasan',
                              style: MyColor().judulCourse,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

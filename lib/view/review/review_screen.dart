import 'package:edu_world/models/review_card_model.dart' as Review;
import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/user_course/components/search_bar.dart';
import 'package:edu_world/view_models/enroll_view_model.dart';
import 'package:edu_world/view_models/review_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  String mentee = '';
  int rating = 5;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final share = await SharedPreferences.getInstance();
      final token = share.getString('token');
      Map<String, dynamic> payload = Jwt.parseJwt(token!);
      mentee = (payload['mentee_id']);
      if (!mounted) return;
      // Provider.of<CourseViewModel>(context, listen: false)
      //     .getEnrolledCourseMentee(mentee, "", "completed");
      Provider.of<ReviewCourseViewModel>(context, listen: false)
          .getReviewCourseByCompletedCourse(mentee);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SearchBarUserCourse(titleSearch: 'Cari di Ulasan'),
            Consumer<ReviewCourseViewModel>(builder: (context, data, _) {
              final loading =
                  data.reviewCourseState == ReviewCourseState.loading;
              final none = data.reviewCourseState == ReviewCourseState.none;
              if (loading) {
                return const CircularProgressIndicator();
              }
              if (none) {
                return Column(
                    children: List.generate(
                  data.reviewCardCourseModel.data?.length ?? 0,
                  (index) {
                    return Card(
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
                              data.reviewCardCourseModel.data![index]
                                  .thumbnail!,
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
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
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: SizedBox(
                                height: double.maxFinite,
                                width: 228,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        data.reviewCardCourseModel.data![index]
                                            .title!,
                                        style: MyColor().reviewCourseTextStyle),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                        data.reviewCardCourseModel.data![index]
                                            .mentor!,
                                        style:
                                            MyColor().reviewCourseSubTextStyle),
                                    const Expanded(
                                      child: SizedBox(
                                        height: 12,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(),
                                        data.reviewCardCourseModel.data![index]
                                                .reviewed!
                                            ? Row(
                                                children: [
                                                  Text(
                                                    'Selesai',
                                                    style: MyColor()
                                                        .reviewCourseTextStyle,
                                                  ),
                                                  const Icon(
                                                    Icons.check_circle,
                                                    color: MyColor.primaryLogo,
                                                  )
                                                ],
                                              )
                                            : SizedBox(
                                                width: 120,
                                                height: 32,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    showBottomRating(
                                                        context,
                                                        data.reviewCardCourseModel
                                                            .data![index]);
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        MyColor.primaryLogo,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Beri Ulasan',
                                                    style:
                                                        MyColor().judulCourse,
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                    const Expanded(
                                      child: SizedBox(
                                        height: 8,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ));
              }
              return const Text('Gagal memuat data');
            })
          ],
        ),
      ),
    );
  }

  void showBottomRating(BuildContext context, Review.Data dataReview) {
    final data = Provider.of<EnrollViewModel>(context, listen: false).mentee;
    TextEditingController description = TextEditingController();
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
                        dataReview.thumbnail!,
                        height: 160,
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(dataReview.title!, style: MyColor().loginField),
                    Text(dataReview.mentor!,
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
                            initialRating: rating.toDouble(),
                            itemBuilder: (context, index) {
                              return const Icon(
                                Icons.star_rounded,
                                color: MyColor.primaryLogo,
                              );
                            },
                            onRatingUpdate: (value) {
                              rating = value.toInt();
                            }),
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
                    Form(
                      key: formKey,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tidak boleh kosong';
                          }
                          return null;
                        },
                        controller: description,
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
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await Provider.of<ReviewCourseViewModel>(
                                        context,
                                        listen: false)
                                    .submitReview(
                                  dataReview.courseId!,
                                  data!,
                                  description.text,
                                  rating,
                                );
                                if (!mounted) return;
                                Provider.of<ReviewCourseViewModel>(context,
                                        listen: false)
                                    .getReviewCourseByCompletedCourse(mentee);
                                Navigator.pop(context);
                                setState(() {});
                              }
                            },
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

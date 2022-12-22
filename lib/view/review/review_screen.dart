import 'package:edu_world/models/review_card_model.dart' as Review;
import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/review/build_review_card.dart';
import 'package:edu_world/view/user_course/components/search_bar.dart';
import 'package:edu_world/view_models/enroll_view_model.dart';
import 'package:edu_world/view_models/profile_view_model.dart';
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
  String menteeName = '';
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
      Provider.of<ReviewCourseViewModel>(context, listen: false)
          .getReviewCourseByCompletedCourse(mentee);
      Provider.of<ProfileViewModel>(context, listen: false).getProfile(context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            const SearchBarUserCourse(titleSearch: 'Cari di Ulasan'),
            Expanded(
              child: Consumer<ReviewCourseViewModel>(
                builder: (context, data, _) {
                  final loading =
                      data.reviewCourseState == ReviewCourseState.loading;
                  final none = data.reviewCourseState == ReviewCourseState.none;
                  if (loading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (none) {
                    return data.reviewCardCourseModel.data == null
                        ? const Center(
                            child: Text('Belum ada kursus yang selesai'),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Column(
                              children: List.generate(
                                data.reviewCardCourseModel.data?.length ?? 0,
                                (index) {
                                  final courseData =
                                      data.reviewCardCourseModel.data![index];
                                  return BuildReviewCard(
                                    courseData: courseData,
                                    mentee: mentee,
                                    onTap: () {
                                      showBottomRating(
                                        context,
                                        data.reviewCardCourseModel.data![index],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                  }
                  return const Text('Gagal memuat data');
                },
              ),
            )
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
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
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
                  MediaQuery.of(context).viewInsets.bottom != 0
                      ? Container()
                      : buildHeaderBottomDialog(dataReview),
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
                      autocorrect: false,
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
                              await Provider.of<ReviewCourseViewModel>(context,
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
                              // setState(() {});
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
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildHeaderBottomDialog(Review.Data dataReview) {
    return Column(
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
      ],
    );
  }
}

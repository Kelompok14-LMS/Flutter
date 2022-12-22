import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/review/review_pdf_certificate.dart';
import 'package:edu_world/view_models/certificate_view_model.dart';
import 'package:edu_world/view_models/profile_view_model.dart';

import '../../models/review_card_model.dart';

class BuildReviewCard extends StatelessWidget {
  const BuildReviewCard({
    Key? key,
    required this.courseData,
    required this.mentee,
    this.onTap,
  }) : super(key: key);
  final Data courseData;
  final String mentee;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    final menteeData = Provider.of<ProfileViewModel>(context).mentees;

    final certificateDataProv = Provider.of<CertificateViewModel>(context);

    return SizedBox(
      height: 130,
      width: double.maxFinite,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              courseData.thumbnail!,
              height: double.maxFinite,
              width: 120,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      courseData.title!,
                      style: MyColor().reviewCourseTextStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(courseData.mentor!,
                        style: MyColor().reviewCourseSubTextStyle),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(child: SizedBox()),
                        courseData.reviewed!
                            ? certificateDataProv.isLoading
                                ? const CircularProgressIndicator()
                                : SizedBox(
                                    height: 30,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: MyColor.primaryLogo,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                        ),
                                        onPressed: () {
                                          Provider.of<CertificateViewModel>(
                                                  context,
                                                  listen: false)
                                              .getCertificate(
                                                  mentee,
                                                  courseData.courseId!,
                                                  menteeData!.data!.fullname!,
                                                  courseData.title!);

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ReviewPDFCertificate(),
                                              ));
                                        },
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.download_rounded,
                                              color: MyColor.primary,
                                              size: 18,
                                            ),
                                            Text(
                                              'Sertifikat',
                                              style: TextStyle(
                                                  color: MyColor.primary,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        )),
                                  )
                            : SizedBox(
                                width: 110,
                                height: 32,
                                child: ElevatedButton(
                                  onPressed: () => onTap!(),
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
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

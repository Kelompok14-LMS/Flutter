import 'package:flutter/material.dart';

import '../../models/course_card_model.dart';
import '../components/app_bar.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            controller: scrollController,
            itemCount: dummyList.length,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              // bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: NetworkImage(
                                dummyList[index].images!,
                              ),
                              fit: BoxFit.cover),
                        ),
                        height: 166,
                        width: 388,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      dummyList[index].header!,
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.more_vert),
                                  color: Colors.white,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                dummyList[index].author!,
                                style: const TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    )
                  ],
                ),
              );
            },
            scrollDirection: Axis.vertical,
          ),
          CustomAppBar(topBarOpacity: topBarOpacity, header: 'Favorite Course')
        ],
      ),
    );
  }

  List<CourseCardModel> dummyList = [
    CourseCardModel(
      header: 'Mastering UIX Design for Industry',
      author: 'Yono Salim',
      images: 'https://i.ibb.co/ZcjM2m5/Rectangle-5-1.png',
    ),
    CourseCardModel(
      header: 'Becoming Full Stack Web Developer',
      author: 'Zeta Vestia',
      images: 'https://i.ibb.co/rpYfcvH/Rectangle-5-2.png',
    ),
    CourseCardModel(
      header: 'Business Analyst untuk Membantu UMKM',
      author: 'Ahok Louis',
      images: 'https://i.ibb.co/JWZs7Fq/Rectangle-5.png',
    ),
  ];
}

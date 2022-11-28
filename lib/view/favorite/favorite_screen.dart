import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/couse_view_model.dart';
import '../components/app_bar.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    Provider.of<CourseViewModel>(context, listen: false).scrollController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final courseViewModel =
        Provider.of<CourseViewModel>(context, listen: false);
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            controller: courseViewModel.scrollController,
            itemCount: courseViewModel.dummyList.length,
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
                                courseViewModel.dummyList[index].images!,
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
                                      courseViewModel.dummyList[index].header!,
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
                                courseViewModel.dummyList[index].author!,
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
          CustomAppBar(
              topBarOpacity: courseViewModel.topBarOpacity,
              header: 'Favorite Course')
        ],
      ),
    );
  }
}

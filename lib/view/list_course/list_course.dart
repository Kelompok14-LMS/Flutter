import 'package:edu_world/utils/constant.dart';
import 'package:flutter/material.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Kelas Course',
            style: MyColor().appTextsStyle,
          ),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: MyColor.primary,
              ))),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: MyColor.primary,
                  hintText: 'Cari Course',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyColor.primary),
                      onPressed: () {},
                      child: const Text('Semua Topik'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyColor.primary),
                      onPressed: () {},
                      child: const Text('UI/UX'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyColor.primary),
                      onPressed: () {},
                      child: const Text('Front End'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyColor.primary),
                      onPressed: () {},
                      child: const Text('Back End'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            // Expanded(
            //   child: GridView.builder(
            //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 2,
            //           crossAxisSpacing: 10,
            //           mainAxisSpacing: 10),
            //       itemCount: 10,
            //       itemBuilder: (context, index) {
            //         return const KelasCourse();
            //       }),
            // )
          ],
        ),
      ),
    );
  }
}

import 'package:edu_world/utils/constant.dart';
import 'package:edu_world/view/list_class/widget/course/kelas_course_home.dart';
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
          onPressed: ()=>Navigator.pop(context), 
        icon: Icon(Icons.arrow_back_ios, color: MyColor.primary,))
      ),
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
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: MyColor.primary,
                  hintText: 'Cari Course',
                  hintStyle: TextStyle(
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
                      child: Text('Semua Topik'),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyColor.primary),
                      onPressed: () {},
                      child: Text('UI/UX'),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyColor.primary),
                      onPressed: () {},
                      child: Text('Front End'),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyColor.primary),
                      onPressed: () {},
                      child: Text('Back End'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 26,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
              ), 
              itemCount: 10,
              itemBuilder: (context, index){
                return KelasCourse();
              }),
            )     
          ],
        ),
      ),
    );
  }
}

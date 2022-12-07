
import 'package:edu_world/utils/constant.dart';
import 'package:flutter/material.dart';

class Rekomendasi extends StatefulWidget {
  const Rekomendasi({super.key});

  @override
  State<Rekomendasi> createState() => _RekomendasiState();
}

class _RekomendasiState extends State<Rekomendasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Rekomendasi', style: MyColor().appTextsStyle),
        leading: IconButton(
          onPressed: () => Navigator.pop(context), 
          icon: Icon(Icons.arrow_back_ios, color: MyColor.primary,),),
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
          ],
        ),),
    );
  }
}
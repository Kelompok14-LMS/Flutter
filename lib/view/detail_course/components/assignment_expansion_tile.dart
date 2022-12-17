import 'package:edu_world/view_models/materials_view_model.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AssignmentExpansionTile extends StatefulWidget {
  const AssignmentExpansionTile({
    Key? key,
  }) : super(key: key);

  @override
  State<AssignmentExpansionTile> createState() =>
      _AssignmentExpansionTileState();
}

class _AssignmentExpansionTileState extends State<AssignmentExpansionTile> {
  @override
  Widget build(BuildContext context) {
    final dataMaterials = Provider.of<MaterialsViewModel>(context);

    return Visibility(
      visible: dataMaterials.modulsEnrolled.assignment!.assignmentId != "",
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            onExpansionChanged: (value) {
              // TODO Navigasi ke assignment
            },
            trailing: const Text(''),
            title: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  height: 20,
                  // width: 70,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF9F7F7),
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "Assignment",
                        style: GoogleFonts.roboto(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFE4B548),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    dataMaterials.modulsEnrolled.assignment!.title!,
                    maxLines: 2,
                    style: GoogleFonts.roboto(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff112D4E),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

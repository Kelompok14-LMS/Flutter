import 'package:edu_world/view/assignment_course/assignment_screen.dart';
import 'package:edu_world/view_models/assignment_view_model.dart';
import 'package:edu_world/view_models/materials_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../utils/constant.dart';

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
    final dataMaterials =
        Provider.of<MaterialsViewModel>(context, listen: false);
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
              Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => TugasScreen(
                  assignmentId:
                      dataMaterials.modulsEnrolled.assignment!.assignmentId!,
                ),
              ));
            },
            trailing: Consumer<AssignmentViewModel>(
                builder: (context, value, child) =>
                    Provider.of<AssignmentViewModel>(context, listen: false)
                            .percent
                            .isNotEmpty
                        ? const Icon(Icons.check_circle,
                            color: MyColor.primaryLogo)
                        : const SizedBox.shrink()),
            title: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  height: 20,
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

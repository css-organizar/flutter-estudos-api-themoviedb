import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieGenreBadgeWidget extends StatelessWidget {
  final String label;
  final bool selected;
  final Function() onTap;

  const MovieGenreBadgeWidget({
    Key? key,
    required this.label,
    required this.onTap,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        color: selected ? Color.fromARGB(255, 20, 55, 74) : Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: selected ? Colors.transparent : Color.fromARGB(255, 241, 243, 245),
              ),
            ),
            child: Center(
              child: Text(
                label,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: selected ? Colors.white : Color.fromARGB(255, 20, 55, 74),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PeopleCard extends StatelessWidget {
  final String name;
  final String username;
  final Function() onTap;
  const PeopleCard({
    Key? key,
    required this.name,
    required this.username,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 332,
      height: 72,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xffEEEEEE),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/image.png'),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 14),
                  Text(
                    name,
                    style: GoogleFonts.roboto().copyWith(
                        color: const Color(0xff141414),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    username,
                    style: GoogleFonts.roboto().copyWith(
                        color: const Color(0xff8C8C8C),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 15),
                ],
              )
            ],
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xffEEEEEE),
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'View',
                style: GoogleFonts.roboto()
                    .copyWith(color: const Color(0xff7000FF)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

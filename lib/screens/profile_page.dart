// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final String address;
  final String image;
  const ProfilePage({
    Key? key,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
    required this.image,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff141414),
          ),
        ),
        title: Text(
          widget.name,
          style: GoogleFonts.roboto()
              .copyWith(color: const Color(0xff141414), fontSize: 20),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 14, right: 21, top: 16),
        child: Column(
          children: [
            //Upper Row

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    widget.image,
                    scale: 8,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: GoogleFonts.roboto().copyWith(
                        color: const Color(0xff141414),
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      widget.username,
                      style: GoogleFonts.roboto().copyWith(
                        color: const Color(0xff8C8C8C),
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),

            //Lower Row

            const SizedBox(height: 16),

            Column(
              children: [
                //Email

                Row(
                  children: [
                    Text(
                      'Email: ',
                      style: GoogleFonts.roboto().copyWith(
                          fontSize: 16, color: const Color(0xff8C8C8C)),
                    ),
                    Text(
                      widget.email,
                      style: GoogleFonts.roboto().copyWith(
                          fontSize: 16, color: const Color(0xff141414)),
                    ),
                  ],
                ),

                //Address

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address: ',
                      style: GoogleFonts.roboto().copyWith(
                          fontSize: 16, color: const Color(0xff8C8C8C)),
                    ),
                    Expanded(
                      child: Text(
                        widget.address,
                        maxLines: 3,
                        style: GoogleFonts.roboto().copyWith(
                            fontSize: 16, color: const Color(0xff141414)),
                      ),
                    ),
                  ],
                ),

                //Phone

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone: ',
                      style: GoogleFonts.roboto().copyWith(
                          fontSize: 16, color: const Color(0xff8C8C8C)),
                    ),
                    Expanded(
                      child: Text(
                        widget.phone,
                        maxLines: 3,
                        style: GoogleFonts.roboto().copyWith(
                            fontSize: 16, color: const Color(0xff141414)),
                      ),
                    ),
                  ],
                ),

                //Website

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Website: ',
                      style: GoogleFonts.roboto().copyWith(
                          fontSize: 16, color: const Color(0xff8C8C8C)),
                    ),
                    Expanded(
                      child: Text(
                        widget.website,
                        maxLines: 3,
                        style: GoogleFonts.roboto().copyWith(
                            fontSize: 16, color: const Color(0xff141414)),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

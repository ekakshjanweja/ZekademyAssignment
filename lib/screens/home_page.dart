import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_profiles/models/user_model.dart';
import 'package:user_profiles/screens/profile_page.dart';
import 'package:user_profiles/utils/custom_page_route.dart';
import 'package:user_profiles/utils/utils.dart';
import 'package:user_profiles/widgets/people_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: SvgPicture.asset('assets/logo.svg'),
          actions: [
            SvgPicture.asset('assets/notifications.svg'),
            const SizedBox(width: 20),
            SvgPicture.asset('assets/Search.svg'),
            const SizedBox(width: 14),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
          child: FutureBuilder<List<User>>(
            future: futureUsers,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    String address =
                        '${snapshot.data![index].address.city} ${snapshot.data![index].address.street} ${snapshot.data![index].address.suite} ${snapshot.data![index].address.zipcode}';
                    return PeopleCard(
                      name: snapshot.data![index].name,
                      username: '@${snapshot.data![index].username}',
                      onTap: () {
                        Navigator.push(
                          context,
                          CustomPageRoute(
                            child: ProfilePage(
                              name: snapshot.data![index].name,
                              username: '@${snapshot.data![index].username}',
                              email: snapshot.data![index].email,
                              phone: snapshot.data![index].phone,
                              website: snapshot.data![index].website,
                              address: address,
                              image: 'assets/imageLarge.png',
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }
            },
          ),
        ),

        //Bottom Nav Bar

        bottomNavigationBar: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 7,
            left: 23,
            right: 22,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/home.svg'),
              SvgPicture.asset('assets/people.svg'),
              SvgPicture.asset('assets/create.svg'),
              SvgPicture.asset('assets/activity.svg'),
              SvgPicture.asset('assets/profile.svg'),
            ],
          ),
        ),
      ),
    );
  }
}

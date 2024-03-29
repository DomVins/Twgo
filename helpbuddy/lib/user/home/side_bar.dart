import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/constants/dimensions.dart';
import 'package:helpbuddy/user/chat/models/user_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UserRightNavBar extends StatefulWidget {
  const UserRightNavBar({Key? key}) : super(key: key);

  @override
  State<UserRightNavBar> createState() => _UserRightNavBarState();
}

class _UserRightNavBarState extends State<UserRightNavBar> {
  UserModel? userModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25 * factor),
              bottomRight: Radius.circular(25 * factor))),
      elevation: 0,
      child: Column(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30 * factor),
                      bottomRight:
                          Radius.circular(30 * factor))), //BoxDecoration
              child: Row(
                children: [
                  SizedBox(
                    width: 14.0 * factor,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/user/profile');
                      },
                      child: Image.asset('assets/images/Account Owner.png')),
                  SizedBox(
                    width: 12.0 * factor,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello Oreoluwa',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w600,
                              fontSize: 24 * factor,
                              color: Colors.black)),
                      Text('@Hello Oreoluwa',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w200,
                              fontSize: 14 * factor,
                              color: Colors.black)),
                    ],
                  )
                ],
              ) //UserAccountDrawerHeader
              ), //DrawerHeader
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SideBarCard(
              iconImage: 'assets/sidebar_svgs/home.png',
              text: 'Home',
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/user/side-bar/messages');
              },
              child: SideBarCard(
                text: 'Messages',
                iconImage: 'assets/sidebar_svgs/messages.png',
              )),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/user/side-bar/notification');
              },
              child: SideBarCard(
                text: 'Notifications',
                iconImage: 'assets/sidebar_svgs/notification.png',
              )),
          /*       InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/user/side-bar/formA',
                  arguments: {
                    'userModel': UserModel(
                        userId: '123',
                        userName: 'FormA',
                        userEmail: 'a@g',
                        phoneNumber: '1',
                        gender: 'Male',
                        firstName: 'Omo',
                        lastName: 'Lola',
                        amount: '123',
                        userDpUrl: 'assets/icons/support.png',
                        password: '123',
                        isOnline: true,
                        role: 'user',
                        nationality: 'NG'),
                    'targetUser': UserModel(
                        userId: '123',
                        userName: 'FormA',
                        userEmail: 'a@g',
                        phoneNumber: '1',
                        gender: 'Male',
                        firstName: 'Omo',
                        lastName: 'Lola',
                        amount: '123',
                        userDpUrl: 'assets/icons/support.png',
                        password: '123',
                        isOnline: true,
                        role: 'user',
                        nationality: 'NG'),
                    'reason': 'formA'
                  },
                );
              },
              child: SideBarCard(
                text: 'FormA',
                iconImage: 'assets/sidebar_svgs/arrow-swap-horizontal.png',
              )),
     */
          InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/user/side-bar/get-to-work',
                  arguments: {
                    'userModel': UserModel(
                        userId: '123',
                        userName: 'Omolola',
                        userEmail: 'a@g',
                        phoneNumber: '1',
                        gender: 'Male',
                        firstName: 'Omo',
                        lastName: 'Lola',
                        amount: '123',
                        userDpUrl: 'assets/images/Account Owner.png',
                        password: '123',
                        isOnline: true,
                        role: 'user',
                        nationality: 'NG'),
                    'targetUser': UserModel(
                        userId: '123',
                        userName: 'Get to Work',
                        userEmail: 'a@g',
                        phoneNumber: '1',
                        gender: 'Male',
                        firstName: 'Omo',
                        lastName: 'Lola',
                        amount: '123',
                        userDpUrl: 'assets/icons/support.png',
                        password: '123',
                        isOnline: true,
                        role: 'user',
                        nationality: 'NG'),
                    'reason': 'get-to-work'
                  },
                );
              },
              child: SideBarCard(
                text: 'Get Work',
                iconImage: 'assets/sidebar_svgs/briefcase.png',
              )),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/user/side-bar/profile');
              },
              child: SideBarCard(
                text: 'Profile',
                iconImage: 'assets/sidebar_svgs/profile.png',
              )),
          const Spacer(
            flex: 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30 * factor),
            child: InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, '/select-role',
                    ModalRoute.withName('/select-role'));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30 * factor),
                padding: EdgeInsets.symmetric(
                    horizontal: 15 * factor, vertical: 10 * factor),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff2781E1),
                    ),
                    borderRadius: BorderRadius.circular(16 * factor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sign Out',
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w400,
                            fontSize: 16 * factor,
                            color: const Color(0xff2781E1))),
                    //SizedBox(width: ,)
                    const Icon(
                      MdiIcons.logout,
                      color: Color(0xff2781E1),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class SideBarCard extends StatelessWidget {
  SideBarCard({Key? key, required this.text, required this.iconImage})
      : super(key: key);
  String text;
  String iconImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5 * factor),
      padding: EdgeInsets.all(15.0 * factor),
      height: 50 * factor,
      color: text == 'Home'
          ? const Color.fromARGB(57, 39, 129, 225)
          : Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 5 * factor,
              ),
              Image.asset(iconImage),
              SizedBox(
                width: 12 * factor,
              ),
              Text(text,
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w200,
                      fontSize: 14 * factor,
                      color: text == 'Home'
                          ? const Color(0xff2781E1)
                          : Colors.black)),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16 * factor,
            color: text == 'Home'
                ? const Color(0xff2781E1)
                : const Color(0xffB9B9B9),
          )
        ],
      ),
    );
  }
}

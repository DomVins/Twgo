import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/constants/dimensions.dart';
import 'package:helpbuddy/super_admin/advertisement/advert_placement.dart';
import 'package:helpbuddy/super_admin/create_admin/create_new_admin.dart';
import 'package:helpbuddy/user/chat/models/user_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RightNavBar extends StatelessWidget {
  const RightNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25 * factor),
              bottomRight: Radius.circular(25 * factor))),
      elevation: 0,
      child: Column(children: [
        DrawerHeader(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30 * factor),
                    bottomRight: Radius.circular(30 * factor))), //BoxDecoration
            child: Row(
              children: [
                SizedBox(
                  width: 14 * factor,
                ),
                Image.asset('assets/images/Account Owner.png'),
                SizedBox(
                  width: 12 * factor,
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

                    //   SizedBox(height: 3,),

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
          child: const SideBarCard(
            iconImage: 'assets/sidebar_svgs/home.png',
            text: 'Home',
          ),
        ),
        InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const CreateAdmin()));
            },
            child: const SideBarCard2(
                iconImage: Icons.person_add_alt_rounded, text: 'Create Admin')),
        InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            '/admin/notification',
          ),
          child: const SideBarCard2(
              iconImage: Icons.notifications, text: 'Notification'),
        ),
        InkWell(
          onTap: () => Navigator.pushNamed(
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
                  userName: 'Educational Consult',
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
          ),
          child: const SideBarCard2(
              iconImage: Icons.school, text: 'Educational Consults'),
        ),
        InkWell(
            onTap: () => Navigator.pushNamed(
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
                        userName: 'Accomondation Request',
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
                ),
            child: const SideBarCard2(
                iconImage: Icons.house, text: 'Accommodation')),
        InkWell(
            onTap: () =>
                Navigator.pushNamed(context, '/super-admin/more/advert'),
            child: const SideBarCard2(
                iconImage: Icons.tv_rounded, text: 'Advert Placement')),
        const Spacer(
          flex: 2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30 * factor),
          child: InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/select-role', ModalRoute.withName('/select-role'));
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
      ]),
    );
  }
}

class SideBarCard extends StatelessWidget {
  const SideBarCard({Key? key, required this.text, required this.iconImage})
      : super(key: key);
  final String text;
  final String iconImage;

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

class SideBarCard2 extends StatelessWidget {
  const SideBarCard2({Key? key, required this.text, required this.iconImage})
      : super(key: key);
  final String text;
  final IconData iconImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0 * factor),
      margin: EdgeInsets.symmetric(vertical: 5 * factor),
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
              Icon(
                iconImage,
                color: const Color.fromARGB(255, 145, 145, 145),
              ),
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

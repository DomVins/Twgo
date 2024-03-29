import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/user/chat/models/user_model.dart';
// import 'package:helpbuddy/user/state/user_state.dart';
import 'package:helpbuddy/utils/constant/theme.dart';
import 'package:helpbuddy/widget/button.dart';
import 'package:helpbuddy/widget/input/outlineInput.dart';
import 'package:helpbuddy/widget/loading.dart';

import 'package:provider/provider.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({Key? key}) : super(key: key);

  @override
  _AdminProfileState createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  TextEditingController? emailController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool loginPasswordVisibility = false;

  final bool _value = false;

  TextEditingController? fullNameController;
  TextEditingController? lastNameController;
  TextEditingController? phoneController;
  TextEditingController? nationalityController;
  TextEditingController? genderController;
  TextEditingController? passwordController;

  UserModel? userModel;

  @override
  void initState() {
    // UserState userState = Provider.of<UserState>(context, listen: false);
    userModel = UserModel(
        userId: '123',
        userName: 'Ore',
        userEmail: 'abc@123.com',
        phoneNumber: '123',
        gender: 'Male',
        firstName: 'Doe',
        lastName: 'John',
        amount: '123',
        userDpUrl: 'assets/images/Account Owner.png',
        password: '123',
        isOnline: true,
        role: 'user',
        nationality: 'Nigerian');
    super.initState();
    emailController = TextEditingController(text: userModel?.userEmail);

    fullNameController = TextEditingController(text: userModel!.userName);
    lastNameController = TextEditingController();
    phoneController = TextEditingController(text: userModel?.phoneNumber);
    nationalityController = TextEditingController(text: userModel?.nationality);
    genderController = TextEditingController(text: userModel?.gender);
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 16,
          ),
        ),
        title: Text('Profile',
            style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Colors.black)),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 120,
                      height: 120,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        'https://picsum.photos/seed/205/600',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('First Name',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BlackOutlineInput(
                  controller: fullNameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Last Name',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BlackOutlineInput(
                  controller: lastNameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Phone Number',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BlackOutlineInput(
                  controller: phoneController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Email Address',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BlackOutlineInput(
                  controller: emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      showPhoneCode: false,

                      countryListTheme: CountryListThemeData(
                        flagSize: 25,
                        backgroundColor: Colors.white,
                        textStyle: ConstantTheme().defaultStyle,
                        bottomSheetHeight:
                            500, // Optional. Country list modal height
                        //Optional. Sets the border radius for the bottomsheet.
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        //Optional. Styles the search field.
                        inputDecoration: InputDecoration(
                          labelText: 'Search',
                          hintText: 'Start typing to search',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xFF8C98A8).withOpacity(0.2),
                            ),
                          ),
                        ),
                      ), // optional. Shows phone code before the country name.
                      onSelect: (Country country) {
                        debugPrint('Select country: ${country.name}');
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Nationality',
                          textAlign: TextAlign.start,
                          style: ConstantTheme().defaultStyle),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlackOutlineInput(
                    controller: nationalityController,
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: false,

                        countryListTheme: CountryListThemeData(
                          flagSize: 25,
                          backgroundColor: Colors.white,
                          textStyle: ConstantTheme().defaultStyle,
                          bottomSheetHeight:
                              500, // Optional. Country list modal height
                          //Optional. Sets the border radius for the bottomsheet.
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          //Optional. Styles the search field.
                          inputDecoration: InputDecoration(
                            labelText: 'Search',
                            hintText: 'Start typing to search',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xFF8C98A8).withOpacity(0.2),
                              ),
                            ),
                          ),
                        ), // optional. Shows phone code before the country name.
                        onSelect: (Country country) {
                          debugPrint('Select country: ${country.name}');
                        },
                      );
                    }),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Gender',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BlackOutlineInput(
                  controller: genderController,
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    Future selectedGender = showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: Text('Select your gender',
                              style: ConstantTheme().bigBlueStyle),
                          children: <Widget>[
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context, 'Male');
                              },
                              child: Text('Male',
                                  style: ConstantTheme().defaultStyle),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                  'Female',
                                );
                              },
                              child: Text('Female',
                                  style: ConstantTheme().defaultStyle),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context, 'Other');
                              },
                              child: Text('Other',
                                  style: ConstantTheme().defaultStyle),
                            ),
                          ],
                        );
                      },
                    );
                    setState(() {
                      //_selectedGender = selectedGender;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Password',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    validator: (String? amountController) {
                      if (amountController!.isEmpty) {
                        return 'Password box is Empty';
                      }
                      return null;
                    },
                    controller: passwordController,
                    obscureText: !loginPasswordVisibility,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color: Color(0xffC4C4C5),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color: Color(0xffC4C4C5),
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color: Color(0xffC4C4C5),
                        ),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color: Color(0xffC4C4C5),
                        ),
                      ),
                      suffixIcon: InkWell(
                        onTap: () => setState(
                          () => loginPasswordVisibility =
                              !loginPasswordVisibility,
                        ),
                        child: Icon(
                          loginPasswordVisibility
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.black,
                          size: 22,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 30,
                ),
                Button(
                  text: 'Complete',
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //   void Resendpin() async {
  //   Loading(context);
  //   HttpRequest('/email-verification',
  //   shouldPopOnError: false,
  //       context: context,
  //       body: {'email': widget.email}, onSuccess: (_, result) {
  //     Navigator.pop(context);
  //     successfulshowSnackbar(context, 'Sent');
  //   }, onFailure: (_, result) {
  //     Navigator.pop(context);
  //     showSnackbar(context, result['message']);
  //     return null;
  //   }, headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer ${token.toString()}'
  //   }).send();
  // }
}

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:helpbuddy/authentication/otp.dart';
import 'package:helpbuddy/constants/dimensions.dart';
import 'package:helpbuddy/utils/constant/theme.dart';

import 'package:helpbuddy/widget/button.dart';
import 'package:helpbuddy/widget/input/outlineInput.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  TextEditingController? emailController;
  TextEditingController? fullNameController;
  TextEditingController? lastNameController;
  TextEditingController? phoneController;
  TextEditingController? nationalityController;
  TextEditingController? genderController;
  TextEditingController? passwordController;

  bool loginPasswordVisibility = false;

  bool _value = false;

  @override
  void initState() {
    emailController = TextEditingController();
    emailController = TextEditingController();
    fullNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneController = TextEditingController();
    nationalityController = TextEditingController();
    genderController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        child: Padding(
          padding: EdgeInsets.all(20.0 * factor),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20 * factor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20 * factor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20 * factor,
                ),
                Text('Get Started',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w500,
                        fontSize: 29 * factor,
                        color: const Color(0xff0D3E73))),
                SizedBox(
                  height: 20 * factor,
                ),
                Text('Already have an account? Sign In',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w400,
                        fontSize: 14 * factor,
                        color: const Color(0xff0D3E73))),
                SizedBox(
                  height: 30 * factor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('First Name',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                SizedBox(
                  height: 10 * factor,
                ),
                BlackOutlineInput(
                  controller: fullNameController,
                ),
                SizedBox(
                  height: 20 * factor,
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
                SizedBox(
                  height: 20 * factor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Phone Number',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                SizedBox(
                  height: 10 * factor,
                ),
                BlackOutlineInput(
                  controller: phoneController,
                ),
                SizedBox(
                  height: 20 * factor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Email Address',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                SizedBox(
                  height: 10 * factor,
                ),
                BlackOutlineInput(
                  controller: emailController,
                ),
                SizedBox(
                  height: 20 * factor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Nationality',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                SizedBox(
                  height: 10 * factor,
                ),
                OutlineInput(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      showPhoneCode: false,

                      countryListTheme: CountryListThemeData(
                        flagSize: 25 * factor,
                        backgroundColor: Colors.white,
                        textStyle: ConstantTheme().defaultStyle,
                        bottomSheetHeight:
                            500 * factor, // Optional. Country list modal height
                        //Optional. Sets the border radius for the bottomsheet.
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0 * factor),
                          topRight: Radius.circular(10.0 * factor),
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
                        setState(() {
                          nationalityController!.text = country.name;
                          debugPrint(nationalityController!.text);
                        });
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 20 * factor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Gender',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                SizedBox(
                  height: 10 * factor,
                ),
                BlackOutlineInput(
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
                                setState(() {
                                  genderController!.text = 'Male';
                                });
                                debugPrint(genderController!.text);
                                Navigator.pop(context);
                              },
                              child: Text('Male',
                                  style: ConstantTheme().defaultStyle),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                setState(() {
                                  genderController!.text = 'Female';
                                });
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
                  },
                ),
                SizedBox(
                  height: 20 * factor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Password',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                SizedBox(
                  height: 10 * factor,
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
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(12 * factor)),
                        borderSide: BorderSide(
                          color: Color(0xffC4C4C5),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(12 * factor)),
                        borderSide: BorderSide(
                          color: Color(0xffC4C4C5),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(12 * factor)),
                        borderSide: BorderSide(
                          color: Color(0xffC4C4C5),
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(12 * factor)),
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
                          size: 22 * factor,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 30 * factor,
                ),
                Row(
                  children: [
                    Checkbox(
                        // fillColor:Colors.white ,
                        value: _value,
                        onChanged: (bool? value) {
                          setState(() {
                            _value = value!;
                            //VALUE = 1;
                          });
                        },
                        activeColor: const Color(0xff2781E1)
                        //   tristate: true,
                        ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        //   _launchURL();
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .70,
                        child: RichText(
                            text: TextSpan(
                                text:
                                    'By clicking this, this , you have agreed to our',
                                style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14 * factor,
                                    color: Colors.black),
                                children: [
                              TextSpan(
                                  text: '  terms',
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14 * factor,
                                      color: const Color(0xff2781E1))),
                              TextSpan(
                                  text: '  and   ',
                                  style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14 * factor,
                                  )),
                              TextSpan(
                                  text: 'conditions',
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14 * factor,
                                      color: const Color(0xff2781E1)))
                            ])),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30 * factor,
                ),
                Button(
                  text: 'Create Account',
                  onTap: () async {
                    /*    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Otp(
                                  email: 'email',
                                  phone: phoneController!.text,
                                ))); */

                    // AuthFuctions().signUpWithEmailAndPassword(
                    //     emailController!.text, passwordController!.text);

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Otp(
                    //               email: "email",
                    //               phone: phoneController!.text,
                    //             )));
                  },
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

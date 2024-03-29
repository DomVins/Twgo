import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:helpbuddy/authentication/forget_password.dart';
import 'package:helpbuddy/constants/dimensions.dart';
import 'package:helpbuddy/super_admin/home/dashboard.dart';
import 'package:helpbuddy/widget/button.dart';
import 'package:helpbuddy/widget/input/outlineInput.dart';

import 'package:helpbuddy/utils/tools.dart' as tools;

class SuperAdminLogin extends StatefulWidget {
  const SuperAdminLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<SuperAdminLogin> createState() => _SuperAdminLoginState();
}

class _SuperAdminLoginState extends State<SuperAdminLogin> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  bool loginPasswordVisibility = false;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/Shapes.png',
                      width: MediaQuery.of(context).size.width * .8,
                    )
                  ],
                ),
              ),
              SizedBox(
                // color: Colors.white,
                height: MediaQuery.of(context).size.height * .9,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.all(15.0 * factor),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SafeArea(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text('Welcome',
                                      style: GoogleFonts.urbanist(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28 * factor,
                                          color: Colors.white)),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text('Back',
                                      style: GoogleFonts.urbanist(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28 * factor,
                                          color: Colors.white)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 70 * factor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Email',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14 * factor,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 5 * factor,
                            ),
                            Form(
                              key: _formKey1,
                              child: OutlineInput(
                                controller: emailController,
                                validator: tools.Validators.validateEmail,
                              ),
                            ),
                            SizedBox(
                              height: 20 * factor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Password',
                                    style: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14 * factor,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 5 * factor,
                            ),
                            Form(
                              key: _formKey2,
                              child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Password is required';
                                    }
                                    return null;
                                  },
                                  controller: passwordController,
                                  obscureText: !loginPasswordVisibility,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12 * factor)),
                                      borderSide: const BorderSide(
                                        color: Color(0xff2781E1),
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      borderSide: BorderSide(
                                        color: Color(0xff2781E1),
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12 * factor)),
                                      borderSide: const BorderSide(
                                        color: Color(0xff2781E1),
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12 * factor)),
                                      borderSide: const BorderSide(
                                        color: Color(0xff2781E1),
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
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 20 * factor, bottom: 20 * factor),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const ForgotpasswordWidget()));
                                    },
                                    child: Text('Forgot Password',
                                        style: GoogleFonts.plusJakartaSans(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15 * factor,
                                            color: const Color(0xff2B47FC))),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Column(
                          children: [
                            Button(
                                text: 'Login',
                                onTap: () async {
                                  // Validate both form fields
                                  bool isFormValid =
                                      _formKey1.currentState!.validate() &&
                                          _formKey2.currentState!.validate();

                                  if (!isFormValid) {
                                    setState(() {
                                      _formKey1.currentState!.validate();
                                      _formKey2.currentState!.validate();
                                    });
                                  } else {
                                    Navigator.pushNamed(
                                        context, '/super-admin/dashboard');
                                  }
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

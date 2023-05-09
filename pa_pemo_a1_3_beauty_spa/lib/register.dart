import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pa_pemo_a1_3_beauty_spa/login_fix.dart';
import 'package:pa_pemo_a1_3_beauty_spa/authentification_service.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool? data = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(253, 254, 219, 227),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height / 9, bottom: 10.0),
                child: Text(
                  "Create Your Account",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "name",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "email",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: birthController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    hintText: "birth",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: genderController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "gender",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "phone number",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                    hintText: "password",
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(top: 5.0, left: 5.0),
                title: Text(
                  "I agree to all Term, Privacy Policy and Fees",
                  style: TextStyle(
                    fontSize: 14
                  ),
                ),
                leading: Checkbox(
                  value: data,
                  onChanged: (bool? value) {
                    setState(() {
                    data = value;
                  });
                }),
              ),
              Container(
                margin: EdgeInsets.only(bottom: size.height * 0.02),
                width: size.width / 2.9,
                child: ElevatedButton(
                  onPressed: () async {
                    if(emailController.text == '' || passwordController.text == '') {
                      Get.snackbar(
                        "", 
                        "",
                        backgroundColor: Colors.red,
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        titleText: Text(
                          "Register Failed",
                        ),
                        messageText: Text(
                          "Please Fill All Field In Form",
                        ),
                      );
                    } else {
                      SignInSignUp? result = await AuthService.registrasiUsingEmailPassword(email: emailController.text, password: passwordController.text);
                      if(result?.user != null) {
                        Get.offAll(LoginPage());
                        Get.snackbar(
                          "", 
                          "",
                          backgroundColor: Colors.blueAccent,
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          titleText: const Text(
                            "Register Success",
                          ),
                          messageText: const Text(
                            'Welcome Back!',
                          ),
                        );
                      } else {
                        Get.snackbar(
                          "", 
                          "",
                          backgroundColor: Colors.red,
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          titleText: const Text("Register Failed"),
                          messageText: Text(
                            result!.message.toString(),
                          ),
                        );
                      }
                    }
                    // Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 184, 35, 73),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                  child: Text("Sign Up")
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(
                    color: Colors.black
                  ),
                  children: [
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(
                        color: Color.fromARGB(255, 184, 35, 73),
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                       ..onTap =() {
                         Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (_){
                              return LoginPage();
                          }),
                        );
                      }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// class RegisterPage extends StatelessWidget {
//   RegisterPage({Key? key}) : super(key: key);

//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [Color(0xff8E9BDE), Color(0xff5365D0)])),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: ListView(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   "assets/logo.png",
//                   width: 200,
//                   height: 200,
//                   fit: BoxFit.fill,
//                 ),
//                 Text(
//                   "Register",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 30,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   "Create your account ",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Colors.black,
//                     fontWeight: FontWeight.normal,
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width / 1.2,
//                   height: 50,
//                   margin: const EdgeInsets.only(
//                     top: 30,
//                   ),
//                   child: TextField(
//                     controller: nameController,
//                     decoration: const InputDecoration(
//                         labelStyle: TextStyle(
//                           color: Color(0xff5265ce),
//                           fontSize: 20,
//                           fontWeight: FontWeight.w300,
//                         ),
//                         border: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xff969697)),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xff5265ce)),
//                         ),
//                         hintText: "Name",
//                         prefixIcon: Icon(Icons.person)),
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width / 1.2,
//                   height: 50,
//                   margin: const EdgeInsets.only(
//                     top: 30,
//                   ),
//                   child: TextField(
//                     controller: emailController,
//                     decoration: const InputDecoration(
//                         labelStyle: TextStyle(
//                           color: Color(0xff5265ce),
//                           fontSize: 20,
//                           fontWeight: FontWeight.w300,
//                         ),
//                         border: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xff969697)),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xff5265ce)),
//                         ),
//                         hintText: "Username",
//                         prefixIcon: Icon(Icons.person)),
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width / 1.2,
//                   height: 50,
//                   margin: const EdgeInsets.only(
//                     top: 30,
//                   ),
//                   child: TextField(
//                     controller: passwordController,
//                     decoration: const InputDecoration(
//                         border: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xff5265ce)),
//                         ),
//                         hintText: "Password",
//                         prefixIcon: Icon(Icons.lock)),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width / 1.2,
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       if (emailController.text == '' ||
//                           passwordController.text == '') {
//                         Get.snackbar(
//                           "",
//                           "",
//                           backgroundColor: Colors.red,
//                           icon: Icon(
//                             Icons.close,
//                             color: Colors.white,
//                           ),
//                           titleText: Text(
//                             "Register Failed",
//                           ),
//                           messageText: Text(
//                             "Please Fill All Field In Form",
//                           ),
//                         );
//                       } else {
//                         SignInSignUpResult? result =
//                             await AuthService.registerUsingEmailPassword(
//                           email: emailController.text,
//                           password: passwordController.text,
//                         );

//                         if (result?.user != null) {
//                           Get.offAll(LoginPage());
//                           Get.snackbar(
//                             "",
//                             "",
//                             backgroundColor: Colors.blueAccent,
//                             icon: const Icon(
//                               Icons.close,
//                               color: Colors.white,
//                             ),
//                             titleText: const Text(
//                               "Register Success",
//                             ),
//                             messageText: const Text(
//                               'Welcome Back!',
//                             ),
//                           );
//                         } else {
//                           Get.snackbar(
//                             "",
//                             "",
//                             backgroundColor: Colors.red,
//                             icon: const Icon(
//                               Icons.close,
//                               color: Colors.white,
//                             ),
//                             titleText: const Text("Register Failed"),
//                             messageText: Text(
//                               result!.message.toString(),
//                             ),
//                           );
//                         }
//                       }
//                       ;
//                     },
//                     // shape: RoundedRectangleBorder(
//                     //     borderRadius: BorderRadius.circular(8)),
//                     // color: Color(0xff5265ce),
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(
//                         vertical: 10,
//                       ),
//                       child: Text(
//                         'Register',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width / 1.2,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         width: (MediaQuery.of(context).size.width / 2) - 60,
//                         height: 1,
//                         color: Color(0xff969697),
//                       ),
//                       const Text(
//                         'or',
//                         style: TextStyle(
//                           color: Color(0xff969697),
//                           fontSize: 14,
//                           fontWeight: FontWeight.w300,
//                         ),
//                       ),
//                       Container(
//                         width: (MediaQuery.of(context).size.width / 2) - 60,
//                         height: 1,
//                         color: Color(0xff969697),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width / 1.2,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Get.to(LoginPage());
//                     },
//                     // shape: RoundedRectangleBorder(
//                     //     borderRadius: BorderRadius.circular(8)),
//                     // color: Color(0xff969697),
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(
//                         vertical: 10,
//                       ),
//                       child: Text(
//                         'Log In',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
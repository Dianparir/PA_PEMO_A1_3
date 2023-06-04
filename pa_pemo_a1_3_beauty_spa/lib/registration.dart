import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:pa_pemo_a1_3_beauty_spa/login_fix.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  // final TextEditingController _genderController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();
  String _errorMessage = '';
  String? _selectedGender;
  bool _isCheckboxChecked = false;
  // bool isNumeric = false;

  Future<void> _registerUser() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (!_isCheckboxChecked) {
        setState(() {
          _errorMessage = 'You must agree to the terms.';
        });
        return;
      }

      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'name': _nameController.text,
        'email': _emailController.text,
        'phone_number': _phoneController.text,
        'birth': _birthController.text,
        'gender': _selectedGender!,
        'password': _passwordController.text,
      });

      // Registrasi Berhasil
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Sign Up Successful', style: Theme.of(context).textTheme.bodyLarge),
            content: Text('Registration successful. Please login.', style: Theme.of(context).textTheme.bodyMedium),
            actions: [
              TextButton(
                onPressed: () {
                  // Navigator.of(context).pop();
                  // Navigator.of(context).pushReplacementNamed(return LoginPage());
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return LoginPage();
                    }),
                  );
                },
                child: Text('OK', style: Theme.of(context).textTheme.bodySmall),
              ),
            ],
          );
        },
      );

      // Pesan Error
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setState(() {
          _errorMessage = 'The password provided is too weak.';
        });
      } else if (e.code == 'email-already-in-use') {
        setState(() {
          _errorMessage = 'The email provided is already in use.';
        });
      } else {
        setState(() {
          // _errorMessage = 'Registration failed. Please try again later.';
          _errorMessage = 'Please Complete the Fields';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'There is an error. Please try again later.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(253, 254, 219, 227),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.13, bottom: 35.0),
                child: Text(
                  "Create Your Account",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) =>
                      value!.isEmpty ? 'Field cannot be empty' : null),
              TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) =>
                      value!.isEmpty ? 'Field cannot be empty' : null),
              TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? 'Field cannot be empty' : null),
              TextField(
                  controller: _birthController,
                  // keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: 'Birth',
                    // icon: Icon(Icons.calendar_today),
                  ),
                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        _birthController.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  }),
              DropdownButtonFormField2<String>(
                value: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Gender',
                ),
                items: ['Male', 'Female'].map((gender) {
                  return DropdownMenuItem(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
              ),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Phone'),
                // validator: (value) => value!.isEmpty ? 'Field tidak boleh kosong' : !isNumeric(value) ? 'Field harus berupa angka' : null,
              ),
              SizedBox(height: 10.0),
              ListTile(
                contentPadding: EdgeInsets.only(top: 5.0, left: 7.0),
                title: Text(
                  "I agree to all Term, Privacy Policy and Fees",
                  style: TextStyle(fontSize: 14),
                ),
                leading: Checkbox(
                    value: _isCheckboxChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isCheckboxChecked = value!;
                      });
                    }),
              ),
              // SizedBox(
              //   height: 8.0
              // ),
              ElevatedButton(
                onPressed: _isCheckboxChecked ? _registerUser : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 184, 35, 73),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: Text('Sign Up'),
              ),
              SizedBox(height: 10.0),
              Text.rich(
                TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                        text: "Sign In",
                        style: TextStyle(
                          color: Color.fromARGB(255, 184, 35, 73),
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) {
                                return LoginPage();
                              }),
                            );
                          }),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

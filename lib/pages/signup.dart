import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:medipal/constant/images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medipal/pages/home.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _licenseController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  String _errorMessage = '';

  void _signUp() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      User? user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(
          '${_firstNameController.text} ${_lastNameController.text}',
        );
        DatabaseReference ref = FirebaseDatabase.instance.ref('users');
        final newRef = ref.child(user.uid);
        await newRef.set({
          'email': user.email,
          'name': '${_firstNameController.text} ${_lastNameController.text}',
        });
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Purple at the top,),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xFF6D98EB),
                Color(0xFFBAA2DA),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.white, size: 40),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          myImage,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 100, 25.0),
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 21.0),
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _firstNameController,
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _lastNameController,
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _phoneNumberController,
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _licenseController,
                        decoration: const InputDecoration(
                          labelText: 'License Number',
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _countryController,
                        decoration: const InputDecoration(
                          labelText: 'Country',
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 31.14),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'By clicking “Create Account” you accept our Terms and Services agreement.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: _signUp,
                      style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all<Size>(const Size(278.0, 44.0)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(const Color(0xFF003CD6)),
                      ),
                      child: const Text(
                        'Create Account',
                        style: TextStyle(
                            color: Color(0xFFEFEFEF),
                            fontSize: 20,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (_errorMessage.isNotEmpty)
                    Text(
                      _errorMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red),
                    ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

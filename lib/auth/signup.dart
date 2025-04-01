import 'package:flutter/material.dart';
import 'package:referandearn/auth/login.dart';
import 'package:referandearn/validator/appvalidator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _passwordVisible = false;
  bool _isLoader = false;
  bool isChecked = false;

  final AppValidator appValidator = AppValidator();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 30.0),
                  const Text(
                    "Invite & Earn – Grow Your Rewards!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Join our growing community and earn exciting rewards by referring your friends. Start sharing and start earning today!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 30.0),
                  const Text(
                    "Create an Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: _userNameController,
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: appValidator.validateUsername,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: appValidator.validateEmail,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: appValidator.validatedPassword,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Flexible(
                        child: RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                              text: "By Signing up, you agree to the ",
                              style: TextStyle(color: Colors.black, fontSize: 17),
                            ),
                            TextSpan(
                              text: "Terms of Service",
                              style: TextStyle(
                                color: Color.fromARGB(255, 18, 144, 248),
                                fontSize: 17,
                              ),
                            ),
                            TextSpan(
                              text: " and Privacy Policy",
                              style: TextStyle(
                                color: Color.fromARGB(255, 18, 144, 248),
                                fontSize: 17,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        // Sign up logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 18, 144, 248),
                      ),
                      child: _isLoader
                          ? const CircularProgressIndicator()
                          : const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: Divider(thickness: 1)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("OR"),
                      ),
                      Expanded(child: Divider(thickness: 1)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.grey),
                      ),
                      icon: Image.asset('images/google-icon.png', height: 24),
                      label: const Text(
                        "Continue with Google",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.grey),
                      ),
                      icon: Image.asset('images/fb.png', height: 24),
                      label: const Text(
                        "Continue with Facebook",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ),
                          TextSpan(
                            text: "Log In",
                            style: TextStyle(
                              color: Color.fromARGB(255, 18, 144, 248),
                              fontSize: 17,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  // submitForm() async {
  //   print("hdbcbvdhs");
  //   if (_formKey.currentState!.validate()) {
  //     setState(() {
  //       _isLoader = true;
  //     });

  //     try {
  //       User? user = await FirebaseAuth.instance.currentUser;

  //       if (user != null) {
  //         CollectionReference users1 =
  //             await FirebaseFirestore.instance.collection('users1');

  //         await users1.doc(user.uid).set({
  //           'username': _userNameController.text,
  //           'email': _emailController.text,
  //         });

  //         setState(() {
  //           _isLoader = false;
  //         });

  //         ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(content: Text("Sign Up Successful")),
  //         );

  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(builder: (context) => Sign_In_page()),
  //         );
  //       }
  //     } catch (e) {
  //       setState(() {
  //         _isLoader = false;
  //       });
  //       // ignore: use_build_context_synchronously
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Sign Up Failed: $e")),
  //       );
  //     }
  //   }
  // }
}

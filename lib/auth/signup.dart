import 'package:flutter/material.dart';
import 'package:referandearn/auth/login.dart';
import 'package:referandearn/validator/appvalidator.dart';

// ignore: camel_case_types
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(right: 50),
          child: Center(child: Text("Sign Up")),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 80.0),
                TextFormField(
                  controller: _userNameController,
                  decoration: _buildInputDecoration('Name'),
                  validator: appValidator.validateUsername,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _buildInputDecoration('Email'),
                  validator: appValidator.validateEmail,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_passwordVisible,
                  decoration: _buildInputDecoration('Password'),
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
                            text: "Term ",
                            style: TextStyle(
                              color: Color.fromARGB(255, 18, 144, 248),
                              fontSize: 17,
                            ),
                          ),
                          TextSpan(
                            text: "of Service and Privacy Policy",
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
                SizedBox(height: 20),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      // final message = await AuthService().Signup(
                      //   email: _emailController.text,
                      //   password: _passwordController.text,
                      // );
                      // if (message!.contains('Success')) {
                      //   await submitForm();
                      // }
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
                          text: "LogIn",
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
    );
  }

  InputDecoration _buildInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      suffixIcon: label == 'Password'
          ? IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            )
          : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.1),
        ),
      ),
      labelStyle: const TextStyle(
        color: Colors.black,
        fontSize: 17,
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

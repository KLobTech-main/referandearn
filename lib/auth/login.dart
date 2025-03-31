import 'package:flutter/material.dart';
import 'package:referandearn/auth/signup.dart';
import 'package:referandearn/validator/appvalidator.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  var isLoader = false;

  var appValidator = AppValidator();

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Center(child: Text("Sign In")),
          ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    height: 90,
                    width: 90,
                    child: Center(
                      child: Image.asset(""),
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Refer&Earn",
                  style: TextStyle(
                      fontSize: 25, color: Color.fromARGB(255, 18, 144, 248)),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "LogIn",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: 80.0,
                    // ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: _buildInputDecoration('Email', Icons.email,
                          prefixIcon: Icons.email),
                      validator: appValidator.validateEmail,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: _buildInputDecoration('Password', Icons.lock,
                          prefixIcon: Icons.lock),
                      validator: appValidator.validatedPassword,
                      // Hides the password text
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 200),
                      child: Text(
                        "Forgot Password?",
                        style:
                            TextStyle(color: Color.fromARGB(255, 18, 144, 248)),
                      ),
                    ),

                    const SizedBox(height: 50),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 18, 144, 248),
                        ),
                        child: isLoader
                            ? const Center(child: CircularProgressIndicator())
                            : const Text("LogIn",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    const Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "OR",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () async {},
                        icon: Image.asset(
                          "images/google-icon.png",
                          height: 30,
                          width: 30,
                        ),
                        label: const Text(
                          "Sign Up With Google",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                        },
                        child: RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                              text: "New to ReferEarn?",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            TextSpan(
                              text: "Sign_Up",
                              style: TextStyle(
                                color: Color.fromARGB(255, 18, 144, 248),
                                fontSize: 17,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ]),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixIcon,
      {IconData? prefixIcon}) {
    return InputDecoration(
      labelText: label,
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      suffixIcon: label == "Password"
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
    );
  }

  // Future<Void?> _submitForm() async {
  //   if (_formKey.currentState!.validate()) {
  //     setState(() {
  //       isLoader = true;
  //     });

  //     var loggedIn = await AuthService().login(
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //     );

  //     setState(() {
  //       isLoader = false;
  //     });

  //     if (loggedIn == "Success") {
  //       await AuthService().saveUserLoggedIn(loginState: true);

  //       Navigator.pushReplacement(
  //         // ignore: use_build_context_synchronously
  //         context,
  //         MaterialPageRoute(builder: (context) => const Home_page()),
  //       );
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text("SignIn failed. Please try again.")),
  //     );
  //   }
  // }
}

import 'package:flutter/gestures.dart';
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top:40,left:12,right:12,bottom:12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Refer & Earn",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 18, 144, 248)),
                  ),
                ),
                SizedBox(height: 40),

                Text("Welcome back Login to your account !", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),

                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildTextField("Email", Icons.email, _emailController, false),
                      SizedBox(height: 15),
                      _buildTextField("Password", Icons.lock, _passwordController, true),
                      SizedBox(height: 10),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Color.fromARGB(255, 18, 144, 248), fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),

                      SizedBox(height: 40),

                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 18, 144, 248),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: isLoader
                              ? Center(child: CircularProgressIndicator(color: Colors.white))
                              : Text("Log In", style: TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                      ),

                      SizedBox(height: 20),

                      Row(
                        children: [
                          Expanded(
                            child: Divider(thickness: 1, color: Colors.grey),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text("OR", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                            child: Divider(thickness: 1, color: Colors.grey),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

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

                      SizedBox(height: 30),
                Center(
                  child: RichText(
                  text: TextSpan(
                  children: [
                  TextSpan(
                  text: "New to ReferEarn? ",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                TextSpan(
                  text: "Sign Up",
                  style: TextStyle(
                    color: Color.fromARGB(255, 18, 144, 248),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                ),
              ],
            ),
          ),
        ),

        ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// Helper function to build text fields
  Widget _buildTextField(String label, IconData icon, TextEditingController controller, bool isPassword) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword ? !_passwordVisible : false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.grey),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.grey),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        )
            : null,
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

}

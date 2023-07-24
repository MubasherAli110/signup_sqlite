import 'package:flutter/material.dart';
import 'package:signup_sqlite/pages/log_in.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../databases/database_helper.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   initData();
  //   super.initState();
  // }

  // Future<void> initData() async {
  //   List<Map<String, dynamic>> items = await DatabaseHelper.getCounters();
  //   if (items.isEmpty) {
  //     nameController;
  //     emailController;
  //     passwordController;
  //   } else {
  //     Map<String, dynamic> item = items[0];
  //      = item['full_name'];
  //      = item['email'];
  //      = item['name'];

  //   }
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  const Center(
                    child: Text(
                      "Welcome to LMS",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 42),
                  const Text(
                    "Full Name",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 4),
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null) {
                        return 'Please Enter Name';
                      } else if (value.trim().isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      hintText: "John Doe",
                      filled: true,
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const Text(
                    "Email",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null) {
                        return 'Please Enter Email';
                      }
                      if (value.trim().isEmpty) {
                        return 'Please Enter Email';
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return 'Please a valid Email';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      hintText: "Enter your Email here",
                      filled: true,
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const Text(
                    "Password",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null) {
                        return 'Please a Enter Password';
                      } else if (value.trim().isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      hintText: "Enter your Password",
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(300, 60),
                            backgroundColor: const Color(0xff007074)),
                        onPressed: () async {
                          bool isFormValid = _formKey.currentState!.validate();
                          if (!isFormValid) {
                            return;
                          }
                          DatabaseHelper.save(nameController.text,
                              emailController.text, passwordController.text);
                          //
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LogIn(),
                            //
                          ));
                          List<Map<String, dynamic>> get =
                              await DatabaseHelper.get();

                          setState(() {
                            print("get $get");
                          });
                        },
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LogIn(),
                              ));
                        },
                        child: const Text(
                          ' Log in',
                          style: TextStyle(
                            color: Color(0xff007074),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

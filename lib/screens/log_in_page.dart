import 'package:flutter/material.dart';
import 'package:project_forthisweek/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  get _sharedPrefs => null;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    checkUserLoggedIn(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lime,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Username'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter username';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter password';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () async {
                        final sharedPrefs =
                            await SharedPreferences.getInstance();

                        if (_formkey.currentState!.validate()) {
                          // ignore: use_build_context_synchronously
                          checkLogin(context);
                          sharedPrefs.setBool('userLoggedIn', true);
                        } else {
                          print('Data empty');
                        }
                      },
                      icon: const Icon(Icons.login),
                      label: const Text('Login'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) {
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username == password) {
      print('Username and Password match');

      Navigator.of(ctx).pushReplacement(
          MaterialPageRoute(builder: (ctx1) => const HomePage()));
    } else {
      const errorMessage = 'Incorrect Username and Password';

      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(5),
          content: Text(errorMessage),
          duration: Duration(seconds: 10),
        ),
      );
    }
  }

  Future<void> checkUserLoggedIn(BuildContext ctx) async {
    final userLoggedIn = _sharedPrefs.getbool('userLoggedIn');
    if (userLoggedIn == null || userLoggedIn == false) {
      const LoginScreen();
    } else {
      Navigator.of(ctx).pushReplacement(
          MaterialPageRoute(builder: (ctx1) => const HomePage()));
    }
  }
}

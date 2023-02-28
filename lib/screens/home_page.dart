// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:project_forthisweek/screens/log_in_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text('Are you sure?'),
                        content: const Text('Do you want to logout'),
                        actions: [
                          TextButton(
                            onPressed: () async {
                              final sharedPrefs =
                                  await SharedPreferences.getInstance();
                              sharedPrefs.setBool('userLogged', false);
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              signout(context);
                            },
                            child: const Text("Yes"),
                          ),
                        ],
                      ));
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: ListView(
        children: [
          Card(
            color: Colors.blue,
            child: ListTile(
              title: const Text('Benz AMg'),
              subtitle: const Text('A pure Sports new Gen '),
              leading: SizedBox(
                height: 100,
                width: 70,
                child: Image.asset("assets/images/pexels-mike-b-112460.jpg"),
              ),
              trailing: const Icon(Icons.star),
            ),
          ),
          const Card(
            child: ListTile(
              title: Text("BMw"),
              subtitle: Text("sports car"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.drivespark.com/imgh/199x150/2022/06/2022-bmw-x1-8.jpg"),
              ),
              trailing: Icon(Icons.star),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('BMW X7'),
              subtitle: const Text('A pure German S'),
              leading: SizedBox(
                height: 100,
                width: 70,
                child: Image.asset("assets/images/pexels-mike-b-170811.jpg"),
              ),
              trailing: const Icon(Icons.star),
            ),
          ),
          const Card(
            child: ListTile(
              title: Text("BMw"),
              subtitle: Text("sports car"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.drivespark.com/imgh/199x150/2022/06/2022-bmw-x1-8.jpg"),
              ),
              trailing: Icon(Icons.star),
            ),
          ),
        ],
      ),
    );
  }

  signout(BuildContext ctx) {
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => const LoginScreen()),
        (route) => false);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:todolist_project/page/dashboard_page.dart';
import 'package:todolist_project/routes/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String statusLogin = '';
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPass = TextEditingController();

  @override
  void dispose() {
    txtUsername.dispose();
    txtPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome to our application",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Please fill username and password to login",
              style: TextStyle(color: Color.fromARGB(255, 34, 56, 166)),
            ),

            const SizedBox(height: 20),

            // Username
            TextField(
              controller: txtUsername,
              decoration: InputDecoration(
                label: const Text('Username'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Password
            TextField(
              controller: txtPass,
              obscureText: true,
              decoration: InputDecoration(
                label: const Text('Password'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (txtUsername.text == 'admin' && txtPass.text == '123') {
                  setState(() {
                    statusLogin = "Berhasil Login";
                  });
                  Get.offNamed(AppRoutes.dahsboardPage);
                } else {
                  setState(() {
                    statusLogin = "Gagal Login";
                  });
                }
                print("status: $statusLogin");
              },
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(
                    Color.fromARGB(255, 27, 95, 190)),
                side: const MaterialStatePropertyAll(
                  BorderSide(width: 1.5),
                ),
              ),
              child: const Text(
                'Login',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              statusLogin,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: statusLogin == "Berhasil Login"
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

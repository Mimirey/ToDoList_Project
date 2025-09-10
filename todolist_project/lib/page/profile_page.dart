import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Profile"),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Aqil
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.all(16),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/aqil.png"),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Aqil Zamzami Musthofa",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Absen: 08",
                      style: TextStyle(fontSize: 14, color: Colors.yellow),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "PPLG SMK RUS",
                      style: TextStyle(fontSize: 14, color: Colors.yellow),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            // Myra
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.all(16),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/myra.png"),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Myra Isadora",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Absen: ndak tau hehe",
                      style: TextStyle(fontSize: 14, color: Colors.yellow),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "PPLG SMK RUS",
                      style: TextStyle(fontSize: 14, color: Colors.yellow),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            // Sylvi
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.all(16),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/sylvi.png"),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Sylviana Jelita Malik",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Absen: ndak tau jugak hehe",
                      style: TextStyle(fontSize: 14, color: Colors.yellow),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "PPLG SMK RUS",
                      style: TextStyle(fontSize: 14, color: Colors.yellow),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

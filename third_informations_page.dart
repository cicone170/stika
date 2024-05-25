import 'package:flutter/material.dart';
import 'package:hack/home.dart';

class ThirdInformationsPage extends StatefulWidget {
  const ThirdInformationsPage({super.key});
  @override
  State<ThirdInformationsPage> createState() {
    return _ThirdInformationsPageState();
  }
}

class _ThirdInformationsPageState extends State<ThirdInformationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: const Image(
                      height: 150,
                      width: 150,
                      image: AssetImage(
                          '/Users/mac/Downloads/PHOTO-2024-05-24-10-24-55.jpg')),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '''Nous sommes ravis de
vous accueillir''',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      height: 1.5,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '''Vos informations ont été enregistrées avec succès. N'hésitez pas à y accéder à tout moment si vous en avez besoin.
Maintenant, vous pouvez pleinement profiter de toutes les fonctionnalités de
notre application.''',
                  style:
                      TextStyle(fontSize: 18, color: Colors.white, height: 2.5),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color.fromARGB(255, 5, 74, 223)),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              TextButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false,
                  );
                },
                child: const Text(
                  'Bienvenue',
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff5ab2ff),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

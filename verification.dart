import 'package:flutter/material.dart';
import 'package:hack/init_informations.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});
  @override
  State<VerificationPage> createState() {
    return _VerificationPageState();
  }
}

class _VerificationPageState extends State<VerificationPage> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: const Color(0xff5ab2ff),
        title: const Text(
          "Inscription",
          style: TextStyle(
              fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
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
                height: 30,
              ),
              const Text(
                "Code de Vérification",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Veuillez entrer le code de vérification",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              const Text(
                "envoyé au +213 550 98 66 69",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              FractionallySizedBox(
                widthFactor: 0.5,
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  controller: otpController,
                  decoration: const InputDecoration(
                    hintText: 'OTP',
                    isDense: true,
                    contentPadding: EdgeInsets.all(20),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () {
                  if (otpController.text == '') {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Le champ est vide.'),
                          content: const Text(
                              'Veuillez compléter le champ pour valider votre inscriription'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    if (otpController.text == "0000") {
                       Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InitInformationsPage()),
                          (route) => false);
                    } else {
                      otpController.text="";
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                                'Le code de vérification est invalide.'),
                            content: const Text(
                                'Veuillez réessayer'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                },
                child: const Text(
                  'Envoyer',
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

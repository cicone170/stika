import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:hack/identification.dart';
import 'package:hack/login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key});
  @override
  State<InscriptionPage> createState() {
    return _InscriptionPageState();
  }
}

String responseID = '';

class _InscriptionPageState extends State<InscriptionPage> {
  Future<Map<String, dynamic>> sendImage(image) async {
    if (image == null) return {};

    var request = http.MultipartRequest(
        'POST', Uri.parse('http://127.0.0.1:5000/upload'));
    request.files.add(await http.MultipartFile.fromPath('image', image!.path));

    var response = await request.send();
    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();
      setState(() {
        responseID = responseString;
      });
      return Map<String, dynamic>.from(json.decode(responseString));

      //print(responseBody);
    } else {
      print('Failed to upload image. Error code: ${response.statusCode}');
      return {};
    }
  }

  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        sendImage(image).then((value) {
          setState(() {
            idController.text=value['id'];
            dateController.text=value['date'];
          });
          
        });
      }
    });
  }

  

  //Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });
  }

  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Photo Gallery'),
            onPressed: () {
              Navigator.of(context).pop();
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

  TextEditingController idController = TextEditingController();
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  File? image;
  String typeID = "";
  
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
                height: 10,
              ),
              const Text(
                "Inscription",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton<String>(
                        borderRadius: BorderRadius.circular(20),
                        underline: Container(),
                        value: typeID,
                        isDense: true,
                        padding: const EdgeInsets.all(10),
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem(
                              value: "",
                              child: Text("Sélectionner un Document")),
                          DropdownMenuItem(
                            value: "CIN",
                            child: Text(
                              "   Carte d'Identité Nationale",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 32, 137, 228)),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "PC",
                            child: Text(
                              "   Permis de Conduire",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 32, 137, 228)),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Carte CHIFA",
                            child: Text(
                              "   Carte CHIFA",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 32, 137, 228)),
                            ),
                          ),
                        ],
                        onChanged: (newValue) {
                          //print(newValue);
                          if (newValue != '') {
                            showOptions();
                          }
                          setState(() {
                            typeID = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'N° d\'Identification',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: TextField(
                      controller: idController,
                      decoration: const InputDecoration(
                        hintText: 'N° d\'Identification',
                        isDense: true,
                        contentPadding: EdgeInsets.all(10),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Nom',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: TextField(
                      controller: nomController,
                      decoration: const InputDecoration(
                        hintText: 'Nom',
                        isDense: true,
                        contentPadding: EdgeInsets.all(10),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Prénom',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: TextField(
                      controller: prenomController,
                      decoration: const InputDecoration(
                        hintText: 'Prénom',
                        isDense: true,
                        contentPadding: EdgeInsets.all(10),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'N° Téléphone',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: TextField(
                      controller: telController,
                      decoration: const InputDecoration(
                        hintText: 'N° Téléphone',
                        isDense: true,
                        contentPadding: EdgeInsets.all(10),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Date de Naissance',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: TextField(
                      controller: dateController,
                      decoration: const InputDecoration(
                        hintText: 'Date de Naissance',
                        isDense: true,
                        contentPadding: EdgeInsets.all(10),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Déjà un compte ?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      }, // inscription button
                      child: const Text(
                        "Connectez-vous",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ))
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () {
                  if (idController.text == "" ||
                      nomController.text == "" ||
                      prenomController.text == "" ||
                      dateController.text == "" ||
                      telController.text == "" ||
                      image == null) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title:
                              const Text('Un ou plusieurs champs sont vides.'),
                          content: const Text(
                              'Veuillez compléter les champs pour passer à la page suivante'),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IdentificationPage()),
                    );
                  }
                },
                child: const Text(
                  'Suivant',
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

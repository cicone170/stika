import 'package:flutter/material.dart';
import 'package:hack/second_informations_page.dart';

class InitInformationsPage extends StatefulWidget {
  const InitInformationsPage({super.key});
  @override
  State<InitInformationsPage> createState() {
    return _InitInformationsPageState();
  }
}

class _InitInformationsPageState extends State<InitInformationsPage> {
  TextEditingController tailleController = TextEditingController();
  TextEditingController poidsController = TextEditingController();
  String sexe = "";

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
                height: 40,
              ),
              const Text(
                "Saisie des Information Initiales",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Genre',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton<String>(
                        underline: Container(),
                        borderRadius: BorderRadius.circular(20),
                        value: sexe,
                        isDense: true,
                        padding: const EdgeInsets.all(15),
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem(
                              value: "", child: Text("Sélectionner le Genre")),
                          DropdownMenuItem(
                            value: "F",
                            child: Text(
                              "   Femme",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 228, 32, 97)),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "H",
                            child: Text(
                              "   Homme",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 32, 137, 228)),
                            ),
                          ),
                        ],
                        onChanged: (newValue) {
                          //print(newValue);
                          if (newValue != '') {
                            //showOptions();
                          }
                          setState(() {
                            sexe = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Taille',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: TextField(
                      controller: tailleController,
                      decoration: const InputDecoration(
                        hintText: 'La taille en cm',
                        isDense: true,
                        contentPadding: EdgeInsets.all(15),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Poids',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: TextField(
                      controller: poidsController,
                      decoration: const InputDecoration(
                        hintText: 'Le Poids en kg',
                        isDense: true,
                        contentPadding: EdgeInsets.all(15),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color.fromARGB(255, 5, 74, 223)),
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
                        color: Colors.white),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onPressed: () {
                        if (tailleController.text == "" || poidsController.text == "" || sexe == "" ) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                    'Un ou plusieurs champs sont vides.'),
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
                                builder: (context) =>
                                    const SecondInformationsPage()),
                          );
                        }
                      },
                      child: const Row(children: [
                        Text(
                          'Suivant',
                          style: TextStyle(
                              fontSize: 25,
                              color: Color(0xff5ab2ff),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10,),
                        Icon(Icons.arrow_forward_sharp, color:Color(0xff5ab2ff) ,)
                      ]),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hack/third_informations_page.dart';

class SecondInformationsPage extends StatefulWidget {
  const SecondInformationsPage({super.key});
  @override
  State<SecondInformationsPage> createState() {
    return _SecondInformationsPageState();
  }
}

class _SecondInformationsPageState extends State<SecondInformationsPage> {
  String regime = "";
  String activite = "";
  String sommeil = "";
  String taba = "";
  String alcool = "";

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
              const Text(
                "Saisie des Information Initiales",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Informations optionnelles.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Régime Alimentaire',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton<String>(
                        underline: Container(),
                        borderRadius: BorderRadius.circular(20),
                        value: regime,
                        isDense: true,
                        padding: const EdgeInsets.all(15),
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem(
                              value: "",
                              child:
                                  Text("Sélectionner le régime alimentaire")),
                          DropdownMenuItem(
                            value: "Équilibré",
                            child: Text(
                              "   Équilibré",
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Perte de poids",
                            child: Text(
                              "   Perte de poids",
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Hypercalorique",
                            child: Text(
                              "   Hypercalorique",
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Autre",
                            child: Text(
                              "   Autre",
                            ),
                          ),
                        ],
                        onChanged: (newValue) {
                          //print(newValue);
                          if (newValue != '') {
                            //showOptions();
                          }
                          setState(() {
                            regime = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Niveau d\'Activité',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton<String>(
                        underline: Container(),
                        borderRadius: BorderRadius.circular(20),
                        value: activite,
                        isDense: true,
                        padding: const EdgeInsets.all(15),
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem(
                              value: "",
                              child: Text("Sélectionner le Niveau d'Activité")),
                          DropdownMenuItem(
                            value: "Sédentaire",
                            child: Text(
                              "   Sédentaire",
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Modérément actif",
                            child: Text(
                              "   Modérément actif",
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Actif",
                            child: Text(
                              "   Actif",
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Très actif",
                            child: Text(
                              "   Très actif",
                            ),
                          ),
                        ],
                        onChanged: (newValue) {
                          //print(newValue);
                          if (newValue != '') {
                            //showOptions();
                          }
                          setState(() {
                            activite = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Profil de Sommeil',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton<String>(
                        underline: Container(),
                        borderRadius: BorderRadius.circular(20),
                        value: sommeil,
                        isDense: true,
                        padding: const EdgeInsets.all(15),
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem(
                              value: "",
                              child:
                                  Text("Sélectionner le profile de sommeil")),
                          DropdownMenuItem(
                            value: "Court",
                            child: Text(
                              "   Court (moins de 6h)",
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Moyen",
                            child: Text(
                              "   Moyen (6h - 8h)",
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Long",
                            child: Text(
                              "   Long (plus de 8h)",
                            ),
                          ),
                        ],
                        onChanged: (newValue) {
                          //print(newValue);
                          if (newValue != '') {
                            //showOptions();
                          }
                          setState(() {
                            sommeil = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Tabagisme',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton<String>(
                        underline: Container(),
                        borderRadius: BorderRadius.circular(20),
                        value: taba,
                        isDense: true,
                        padding: const EdgeInsets.all(15),
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem(
                              value: "",
                              child: Text("Sélectionner le statut tabagique")),
                          DropdownMenuItem(
                            value: "Non-fumeur",
                            child: Text(
                              "   Non-fumeur",
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Fumeur",
                            child: Text(
                              "   Fumeur",
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Occasionnel",
                            child: Text(
                              "   Fumeur occasionnel",
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Ancien",
                            child: Text(
                              "   Ancien fumeur",
                            ),
                          ),
                        ],
                        onChanged: (newValue) {
                          //print(newValue);
                          if (newValue != '') {
                            //showOptions();
                          }
                          setState(() {
                            taba = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Consommation d\'Alcool',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton<String>(
                        underline: Container(),
                        borderRadius: BorderRadius.circular(20),
                        value: alcool,
                        isDense: true,
                        padding: const EdgeInsets.all(15),
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem(
                              value: "",
                              child: Text(
                                  "Sélectionner la consommation d'alcool")),
                          DropdownMenuItem(
                            value: "Negatif",
                            child: Text(
                              "   Pas d'alcool",
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Occasionnelle",
                            child: Text(
                              "   Occasionnelle",
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Fréquente",
                            child: Text(
                              "   Fréquente",
                            ),
                          ),
                        ],
                        onChanged: (newValue) {
                          //print(newValue);
                          if (newValue != '') {
                            //showOptions();
                          }
                          setState(() {
                            alcool = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
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
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 50, left: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(
                          context, //SecondInformationsPage
                        );
                      },
                      child: const Row(children: [
                        Icon(
                          Icons.chevron_left_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Retour',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ThirdInformationsPage()), //SecondInformationsPage
                        );
                      },
                      child: const Row(children: [
                        Text(
                          'Suivant',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.white,
                        )
                      ]),
                    )
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

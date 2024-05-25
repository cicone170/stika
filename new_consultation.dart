import 'package:flutter/material.dart';
import 'package:hack/bottom_bar.dart';
import 'package:hack/choose_doc.dart';
import 'package:hack/prediction.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class NewConsultationPage extends StatefulWidget {
  const NewConsultationPage({super.key});
  @override
  State<NewConsultationPage> createState() {
    return _NewConsultationPageState();
  }
}

class _NewConsultationPageState extends State<NewConsultationPage> {
  List<String?> mainlist = [];

  static List<String?> symptomesGeneraux = [
    "Fièvre élevée",
    "Fièvre légère",
    "Fatigue",
    "Léthargie",
    "Malaise",
    "Prise de poids",
    "Augmentation de l'appétit",
  ];
  final items = symptomesGeneraux
      .map((item) => MultiSelectItem<String?>(item, item!))
      .toList();
  List<String?> selectedItems = [];

  static List<String?> symptomesCutanesDermatologiques = [
    "Éruption cutannée",
    "Éruptions cutanées nodulaires",
    "Démangeaisons",
    "Peau jaunâtre",
    "Taches dyschromiques",
    "Rougeur des yeux",
    "Boutons purulents",
    "Points noirs",
    "Cicatrices",
    "Plaie rouge autour du nez"
  ];
  final items1 = symptomesCutanesDermatologiques
      .map((item) => MultiSelectItem<String?>(item, item!))
      .toList();
  List<String?> selectedItems1 = [];

  static List<String?> symptomesRespiratoires = [
    "Toux",
    "Irritation de la gorge",
    "Nez coulant",
    "Congestion",
    "Pression sinusale",
    "Éternuements continus",
    "Essoufflement",
    "Sang dans les expectorations",
  ];
  final items2 = symptomesRespiratoires
      .map((item) => MultiSelectItem<String?>(item, item!))
      .toList();
  List<String?> selectedItems2 = [];

  static List<String?> symptomesGastroIntestinaux = [
    "Douleur abdominale",
    "Douleur au ventre",
    "Distension de l'abdomen",
    "Vomissements",
    "Nausées",
    "Diarrhée",
    "Constipation",
    "Perte d'appétit",
  ];
  final items3 = symptomesGastroIntestinaux
      .map((item) => MultiSelectItem<String?>(item, item!))
      .toList();
  List<String?> selectedItems3 = [];

  static List<String?> symptomesMusculosquelettiques = [
    "Douleur articulaire",
    "Mal de dos",
    "Douleur au cou",
    "Douleur au genou",
    "Douleur au moment des mouvements intestinaux",
    "Douleur en marchant"
        "Atrophie musculaire",
    "Faiblesse musculaire",
    "Faiblesse des membres",
    "Articulations enflées",
    "Jambes enflées",
  ];
  final items4 = symptomesMusculosquelettiques
      .map((item) => MultiSelectItem<String?>(item, item!))
      .toList();
  List<String?> selectedItems4 = [];

  static List<String?> symptomesCardiovasculaires = [
    "Douleur thoracique",
    "Rythme cardiaque accéléré",
    "Palpitations",
    "Gonflement des extrémités",
    "Veines proéminentes sur le mollet",
  ];
  final items5 = symptomesCardiovasculaires
      .map((item) => MultiSelectItem<String?>(item, item!))
      .toList();
  List<String?> selectedItems5 = [];

  static List<String?> symptomesNeurologiques = [
    "Mal de tête",
    "Vision floue et déformée",
    "Vertiges",
    "Troubles visuels",
    "Perte d'équilibre,",
    "Instabilité",
    "Mouvements rapides",
    "Anxiété",
    "Sautes d'humeur",
    "Dépression",
    "Agitation",
    "Manque de concentration"
  ];
  final items6 = symptomesNeurologiques
      .map((item) => MultiSelectItem<String?>(item, item!))
      .toList();
  List<String?> selectedItems6 = [];

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.white,
            height: 1.5,
          ),
        ),
        backgroundColor: const Color(0xff1679AB),
        foregroundColor: Colors.white,
        title: const Text(
          "Consultaions",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(
        2,
        scrollController: scrollController,
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    "Symptômes",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "(Optionnel)",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              MultiSelectBottomSheetField<String?>(
                decoration: const BoxDecoration(color: Colors.white),
                initialChildSize: 0.4,
                maxChildSize: 0.95,
                listType: MultiSelectListType.CHIP,
                selectedColor: const Color.fromARGB(255, 203, 20, 20),
                selectedItemsTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                unselectedColor: const Color.fromARGB(255, 201, 201, 201),
                buttonIcon: const Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                searchHintStyle: const TextStyle(
                  fontSize: 20,
                ),
                searchable: true,
                buttonText: const Text(
                  'Généraux',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
                title: const Text(
                  'Généraux',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                items: items,
                onConfirm: (values) {
                  setState(() {
                    selectedItems = values;
                  });
                  print('selected : ${selectedItems}');

                  for (var item in selectedItems) {
                    print(item);
                  }
                  /*senduserdata(
                    'partnerreligion', '${_selectedItems.toString()}');*/
                },
                chipDisplay: MultiSelectChipDisplay(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  onTap: (value) {
                    setState(() {
                      selectedItems.remove(value);
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              MultiSelectBottomSheetField<String?>(
                decoration: const BoxDecoration(color: Colors.white),
                initialChildSize: 0.4,
                maxChildSize: 0.95,
                listType: MultiSelectListType.CHIP,
                selectedColor: const Color.fromARGB(255, 203, 20, 20),
                selectedItemsTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                unselectedColor: const Color.fromARGB(255, 201, 201, 201),
                buttonIcon: const Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                searchHintStyle: const TextStyle(
                  fontSize: 20,
                ),
                searchable: true,
                buttonText: const Text(
                  'Cutanés et Dermatologiques', ///////*
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
                title: const Text(
                  'Cutanés et Dermatologiques', ///////
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 25,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                items: items1, ///////
                onConfirm: (values) {
                  setState(() {
                    selectedItems1 = values;

                    ///
                  });
                  print('selected : ${selectedItems1}'); //////

                  for (var item in selectedItems1) {
                    /////
                    print(item);
                  }
                },
                chipDisplay: MultiSelectChipDisplay(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  onTap: (value) {
                    setState(() {
                      selectedItems1.remove(value); ///////
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              MultiSelectBottomSheetField<String?>(
                decoration: const BoxDecoration(color: Colors.white),
                initialChildSize: 0.4,
                maxChildSize: 0.95,
                listType: MultiSelectListType.CHIP,
                selectedColor: const Color.fromARGB(255, 203, 20, 20),
                selectedItemsTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                unselectedColor: const Color.fromARGB(255, 201, 201, 201),
                buttonIcon: const Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                searchHintStyle: const TextStyle(
                  fontSize: 20,
                ),
                searchable: true,
                buttonText: const Text(
                  'Respiratoires', ///////*
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
                title: const Text(
                  'Respiratoires', ///////
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 25,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                items: items2, ///////
                onConfirm: (values) {
                  setState(() {
                    selectedItems2 = values;

                    ///
                  });
                  print('selected : ${selectedItems2}'); //////

                  for (var item in selectedItems2) {
                    /////
                    print(item);
                  }
                },
                chipDisplay: MultiSelectChipDisplay(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  onTap: (value) {
                    setState(() {
                      selectedItems2.remove(value); ///////
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              MultiSelectBottomSheetField<String?>(
                decoration: const BoxDecoration(color: Colors.white),
                initialChildSize: 0.4,
                maxChildSize: 0.95,
                listType: MultiSelectListType.CHIP,
                selectedColor: const Color.fromARGB(255, 203, 20, 20),
                selectedItemsTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                unselectedColor: const Color.fromARGB(255, 201, 201, 201),
                buttonIcon: const Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                searchHintStyle: const TextStyle(
                  fontSize: 20,
                ),
                searchable: true,
                buttonText: const Text(
                  'Gastro-intestinaux', ///////*
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
                title: const Text(
                  'Gastro-intestinaux', ///////
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 25,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                items: items3, ///////
                onConfirm: (values) {
                  setState(() {
                    selectedItems3 = values;

                    ///
                  });
                  print('selected : ${selectedItems3}'); //////

                  for (var item in selectedItems3) {
                    /////
                    print(item);
                  }
                },
                chipDisplay: MultiSelectChipDisplay(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  onTap: (value) {
                    setState(() {
                      selectedItems3.remove(value); ///////
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              MultiSelectBottomSheetField<String?>(
                decoration: const BoxDecoration(color: Colors.white),
                initialChildSize: 0.4,
                maxChildSize: 0.95,
                listType: MultiSelectListType.CHIP,
                selectedColor: const Color.fromARGB(255, 203, 20, 20),
                selectedItemsTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                unselectedColor: const Color.fromARGB(255, 201, 201, 201),
                buttonIcon: const Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                searchHintStyle: const TextStyle(
                  fontSize: 20,
                ),
                searchable: true,
                buttonText: const Text(
                  'Musculosquelettiques', ///////*
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
                title: const Text(
                  'Musculosquelettiques', ///////
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 25,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                items: items4, ///////
                onConfirm: (values) {
                  setState(() {
                    selectedItems4 = values;

                    ///
                  });
                  print('selected : ${selectedItems4}'); //////

                  for (var item in selectedItems4) {
                    /////
                    print(item);
                  }
                },
                chipDisplay: MultiSelectChipDisplay(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  onTap: (value) {
                    setState(() {
                      selectedItems4.remove(value); ///////
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              MultiSelectBottomSheetField<String?>(
                decoration: const BoxDecoration(color: Colors.white),
                initialChildSize: 0.4,
                maxChildSize: 0.95,
                listType: MultiSelectListType.CHIP,
                selectedColor: const Color.fromARGB(255, 203, 20, 20),
                selectedItemsTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                unselectedColor: const Color.fromARGB(255, 201, 201, 201),
                buttonIcon: const Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                searchHintStyle: const TextStyle(
                  fontSize: 20,
                ),
                searchable: true,
                buttonText: const Text(
                  'Cardiovasculaires', ///////*
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
                title: const Text(
                  'Cardiovasculaires', ///////
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 25,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                items: items5, ///////
                onConfirm: (values) {
                  setState(() {
                    selectedItems5 = values;

                    ///
                  });
                  print('selected : ${selectedItems5}'); //////

                  for (var item in selectedItems5) {
                    /////
                    print(item);
                  }
                },
                chipDisplay: MultiSelectChipDisplay(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  onTap: (value) {
                    setState(() {
                      selectedItems5.remove(value); ///////
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              MultiSelectBottomSheetField<String?>(
                decoration: const BoxDecoration(color: Colors.white),
                initialChildSize: 0.4,
                maxChildSize: 0.95,
                listType: MultiSelectListType.CHIP,
                selectedColor: const Color.fromARGB(255, 203, 20, 20),
                selectedItemsTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                unselectedColor: const Color.fromARGB(255, 201, 201, 201),
                buttonIcon: const Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                searchHintStyle: const TextStyle(
                  fontSize: 20,
                ),
                searchable: true,
                buttonText: const Text(
                  'Neurologiques', ///////*
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
                title: const Text(
                  'Neurologiques', ///////
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 25,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                items: items6, ///////
                onConfirm: (values) {
                  setState(() {
                    selectedItems6 = values;

                    ///
                  });
                  print('selected : ${selectedItems6}'); //////

                  for (var item in selectedItems6) {
                    /////
                    print(item);
                  }
                },
                chipDisplay: MultiSelectChipDisplay(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  onTap: (value) {
                    setState(() {
                      selectedItems6.remove(value); ///////
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          mainlist = selectedItems +
                              selectedItems1 +
                              selectedItems2 +
                              selectedItems3 +
                              selectedItems4 +
                              selectedItems5 +
                              selectedItems6;
                        });
                        if (mainlist.isEmpty) {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChooseDocPage()),
                        );
                        } else {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  PredictionPage(list: mainlist,)),
                        );
                        }
                        print(mainlist);
                        
                      },
                      child: const Text(
                        "Suivant",
                        style: TextStyle(fontSize: 25),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

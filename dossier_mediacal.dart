import 'package:flutter/material.dart';
import 'package:hack/bottom_bar.dart';

class DossierMedicalPage extends StatefulWidget {
  const DossierMedicalPage({super.key});
  @override
  State<DossierMedicalPage> createState() {
    return _DossierMedicalPageState();
  }
}

class _DossierMedicalPageState extends State<DossierMedicalPage> {
  ScrollController scrollController = ScrollController();
  final List<Map<String, dynamic>> dataList = [
    {'text': 'Données générales'},
    {'text': 'Historique des diagnostiques'},
    {'text': 'Résultats des examens et tests'},
    {'text': 'Médicaments et traitements en cours'},
    {'text': 'Antécédents médicaux'},
    {'text': 'Interventions chirurgicales'},
    {'text': 'Documents administratifs'},
  ];
  Widget buildRowWidget(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DossierMedicalInsidePage(
                      text: text,
                    )),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 20),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.chevron_right_rounded)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            "Dossier Médical",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: MyBottomAppBar(
          3,
          scrollController: scrollController,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: dataList.map((data) {
                return buildRowWidget(data['text']);
              }).toList(),
            ),
          ),
        ));
  }
}

class DossierMedicalInsidePage extends StatefulWidget {
  final String text;
  const DossierMedicalInsidePage({super.key, required this.text});
  @override
  State<DossierMedicalInsidePage> createState() {
    return _DossierMedicalInsidePageState();
  }
}

class _DossierMedicalInsidePageState extends State<DossierMedicalInsidePage> {
  final List<Map<String, dynamic>> dataList = [
    // backend liste dynamique
    {'text': 'Données générales'},
    {'text': 'Historique des diagnostiques'},
    {'text': 'Résultats des examens et tests'},
    {'text': 'Médicaments et traitements en cours'},
    {'text': 'Antécédents médicaux'},
    {'text': 'Interventions chirurgicales'},
    {'text': 'Documents administratifs'},
  ];
  Widget buildRowWidget(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DossierMedicalInformtionsPage(
                      text: text,
                    )),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 20),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.chevron_right_rounded)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            "Dossier Médical",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: const MyBottomAppBar(
          3,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Text(
                  '${widget.text}:',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: dataList.map((data) {
                    return buildRowWidget(data['text']);
                  }).toList(),
                ),
              ),
            ],
          ),
        ));
  }
}

class DossierMedicalInformtionsPage extends StatefulWidget {
  final String text;
  const DossierMedicalInformtionsPage({super.key, required this.text});
  @override
  State<DossierMedicalInformtionsPage> createState() {
    return _DossierMedicalInformtionsPageState();
  }
}

class _DossierMedicalInformtionsPageState
    extends State<DossierMedicalInformtionsPage> {
  final List<Map<String, dynamic>> dataList = [
    // backend liste dynamique
    {'title': 'Données générales', 'text': 'Données générales'},
    {'title': 'Historique des diagnostiques', 'text': 'Données générales'},
    {'title': 'Résultats des examens et tests', 'text': 'Données générales'},
    {
      'title': 'Médicaments et traitements en cours',
      'text': 'Données générales'
    },
    {'title': 'Antécédents médicaux', 'text': 'Données générales'},
    {'title': 'Interventions chirurgicales', 'text': 'Données générales'},
    {'title': 'Documents administratifs', 'text': 'Données générales'},
  ];
  Widget buildRowWidget(String title, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xff69A8E0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                text,
                style: const TextStyle(fontSize: 17, color: Colors.white),
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            "Dossier Médical",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: const MyBottomAppBar(
          3,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Text(
                  '${widget.text}:',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: dataList.map((data) {
                    return buildRowWidget(data['title'], data['text']);
                  }).toList(),
                ),
              ),
            ],
          ),
        ));
  }
}

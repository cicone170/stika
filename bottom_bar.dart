import 'package:flutter/material.dart';
import 'package:hack/consultation.dart';
import 'package:hack/dossier_mediacal.dart';
import 'package:hack/home.dart';
import 'package:hack/profil.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar(this.currentIcone, {super.key, this.scrollController});
  final ScrollController? scrollController;
  final int currentIcone;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.white, width: 1.5))),
      child: BottomAppBar(
        color: const Color(0xff1679AB),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: IconButton(
                    padding: const EdgeInsets.all(0.0),
                    splashRadius: 20,
                    iconSize: 40,
                    onPressed: () {
                      currentIcone == 1
                          ? scrollController!.animateTo(0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn)
                          : Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                              (route) => false);
                    },
                    icon: Icon(
                      currentIcone == 1
                          ? Icons.home_rounded
                          : Icons.home_outlined,
                      color: currentIcone == 1 ? Colors.white : Colors.black,
                    )),
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: IconButton(
                    padding: const EdgeInsets.all(0.0),
                    splashRadius: 20,
                    iconSize: 35,
                    onPressed: () {
                      currentIcone == 2
                          ? scrollController!.animateTo(0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn)
                          : Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ConsultationPage()),
                              (route) => false);
                    },
                    icon: Icon(
                      currentIcone == 2
                          ? Icons.calendar_today_rounded
                          : Icons.calendar_today_outlined,
                      color: currentIcone == 2 ? Colors.white : Colors.black,
                    )),
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: IconButton(
                    padding: const EdgeInsets.all(0.0),
                    splashRadius: 20,
                    iconSize: 40,
                    onPressed: () {
                      currentIcone == 3
                          ? {}
                          : Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DossierMedicalPage()),
                              (route) => false);
                    },
                    icon: Icon(
                      currentIcone == 3
                          ? Icons.topic_rounded
                          : Icons.topic_outlined,
                      color: currentIcone == 3 ? Colors.white : Colors.black,
                    )),
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: IconButton(
                    padding: const EdgeInsets.all(0.0),
                    splashRadius: 20,
                    iconSize: 40,
                    onPressed: () {
                      currentIcone == 4
                          ? scrollController!.animateTo(0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn)
                          : Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfilPage()),
                              (route) => false);
                    },
                    icon: Icon(
                      currentIcone == 4
                          ? Icons.person_rounded
                          : Icons.person_outline,
                      color: currentIcone == 4 ? Colors.white : Colors.black,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

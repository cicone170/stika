import 'package:flutter/material.dart';
import 'package:hack/bottom_bar.dart';
import 'package:hack/new_consultation.dart';

class ConsultationPage extends StatefulWidget {
  const ConsultationPage({super.key});
  @override
  State<ConsultationPage> createState() {
    return _ConsultationPageState();
  }
}

class _ConsultationPageState extends State<ConsultationPage> {
  Widget doc(String nom, String fonc, String date, String mois) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const Image(
                    height: 70,
                    width: 70,
                    image: AssetImage(
                      '/Users/mac/Downloads/portrait-of-a-happy-young-doctor-in-his-clinic-royalty-free-image-1661432441.jpg',
                    )),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. $nom',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(fonc),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text(
                date,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                mois,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xff69A8E0),
                      ),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(20)),
                    ),
                    icon: const Icon(
                      Icons.add_circle_rounded,
                      color: Colors.white,
                      size: 35,
                    ),
                    label: const Text(
                      "Nouvelle Consultation",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewConsultationPage()),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Prochaines Consultation",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                doc("BENNINI", "Médecin Généraliste", "02", "Juillet"),
                const SizedBox(
                  height: 15,
                ),
                doc("CHABANI", "Cardiologue", "24", "Juin"),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Historique des Consultations",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                doc("SMETI", "Médecin Généraliste", "20", "Déc"),
                const SizedBox(
                  height: 15,
                ),
                doc("MEHTAR", "Cardiologue", "24", "Août"),
                const SizedBox(
                  height: 5,
                ),
                doc("AMOUI", "Médecin Généraliste", "16", "Juillet"),
                const SizedBox(
                  height: 15,
                ),
                doc("BOUBEKER", "Cardiologue", "09", "Juin"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

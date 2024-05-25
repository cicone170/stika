import 'package:flutter/material.dart';
import 'package:hack/bottom_bar.dart';
import 'package:hack/doc.dart';

class ChooseDocPage extends StatefulWidget {
  const ChooseDocPage({super.key});
  @override
  State<ChooseDocPage> createState() {
    return _ChooseDocPageState();
  }
}

class _ChooseDocPageState extends State<ChooseDocPage> {
  Widget doc(String nom, String fonc) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DocPage(name: nom, fonc: fonc,)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                const Text(
                  "Médecins suggérés",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                doc("BENNINI", "Médecin Généraliste"),
                const SizedBox(
                  height: 15,
                ),
                doc("CHABANI", "Cardiologue"),
                const SizedBox(
                  height: 15,
                ),
                doc("SMETI", "Médecin Généraliste"),
                const SizedBox(
                  height: 15,
                ),
                doc("MEHTAR", "Cardiologue"),
                const SizedBox(
                  height: 5,
                ),
                doc("AMOUI", "Médecin Généraliste"),
                const SizedBox(
                  height: 15,
                ),
                doc("BOUBEKER", "Cardiologue"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:bubble_tea/themes/colors.dart';
import 'package:bubble_tea/views/menu_page.dart';
import 'package:bubble_tea/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 50,
            ),
            // nom de la boutique
            Center(
              child: Text(
                "BOB'BLES",
                style: GoogleFonts.anton(
                  fontSize: 30,
                  color: textColor,
                ),
              ),
            ),
            // sous titre nom boutique
            Center(
              child: Text(
                "World's best bubble teas",
                style: TextStyle(color: textColor),
              ),
            ),
            // logo de la boutique
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/assets/images/bt_main.png'),
            ),
            const SizedBox(
              height: 25,
            ),
            // titre
            Text(
              "WHEN POPPING TRIGGERS HAPPINESS",
              style: GoogleFonts.anton(
                fontSize: 44,
                color: textColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // sous-titre
            const Text(
              "''Feel the freshness from anywhere at anytime''",
              style: TextStyle(
                color: Color.fromARGB(255, 243, 243, 243),
                height: 2,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            // boutton 'get started'
            MyButton(
              text: "Let's Drink !",
              onTap: () {
                // aller vers le menu
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MenuPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

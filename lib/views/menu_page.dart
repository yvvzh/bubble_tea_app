import 'package:bubble_tea/themes/colors.dart';
import 'package:bubble_tea/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          'Bubble Tea',
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: mainColor, borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    // message promotionnel
                    Text(
                      'Earn 15% Discount',
                      style: GoogleFonts.anton(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // bouton redeem
                    MyButton(text: "Redeem", onTap: () {}),
                  ],
                ),
                // image
                Image.asset(
                  'lib/images/bt_main.png',
                  height: 100,
                )
              ],
            ),
          )
          // searchbar

          // liste des menus

          // choix fréquent
        ],
      ),
    );
  }
}

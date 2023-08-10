import 'package:bubble_tea/models/tea.dart';
import 'package:bubble_tea/themes/colors.dart';
import 'package:bubble_tea/utils/button.dart';
import 'package:bubble_tea/utils/drink_tile.dart';
import 'package:bubble_tea/views/tea_details_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // menu des boissons
  List drinkMenu = [
    // pastèque
    Tea(
        name: "Watermelon",
        price: "5,90",
        imgPath: "lib/images/bt_red.png",
        stars: "4.4"),
    // mojito
    Tea(
        name: "Mojito",
        price: "6,50",
        imgPath: "lib/images/bt_green.png",
        stars: "4.2"),
    // café
    Tea(
        name: "Coffee",
        price: "4,90",
        imgPath: "lib/images/bt_coffee.png",
        stars: "4.7"),
    // framboise
    Tea(
        name: "Raspberry",
        price: "6,90",
        imgPath: "lib/images/bt_pink.png",
        stars: "4.9"),
  ];

  // onTap naviguer vers la page de détails du tea
  void navigateToTeaDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TeaDetailsPage(
          tea: drinkMenu[index],
        ),
      ),
    );
  }

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: mainColor, borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
          ),

          const SizedBox(height: 25),

          // searchbar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Search here.."),
            ),
          ),

          const SizedBox(height: 25),

          // liste des menus
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Drinks Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18,
              ),
            ),
          ),

          const SizedBox(height: 25),

          Expanded(
              child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: drinkMenu.length,
            itemBuilder: (context, index) => DrinkTile(
              tea: drinkMenu[index],
              onTap: () => navigateToTeaDetails(index),
            ),
          )),

          const SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Most Popular Delicacy",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18,
              ),
            ),
          ),

          const SizedBox(height: 25),

          // recommendations
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // image
                    Image.asset(
                      'lib/images/bt_pink.png',
                      height: 60,
                    ),

                    const SizedBox(width: 20),

                    // nom et prix
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // nom
                        Text(
                          "Raspberry",
                          style: GoogleFonts.anton(fontSize: 18),
                        ),
                        const SizedBox(height: 10),

                        // prix
                        Text(
                          '6,90€',
                          style: TextStyle(color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ],
                ),

                // coeur
                const Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

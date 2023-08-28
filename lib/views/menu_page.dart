import 'package:bubble_tea/models/shop.dart';
import 'package:bubble_tea/themes/colors.dart';
import 'package:bubble_tea/views/cart_page.dart';
import 'package:bubble_tea/widgets/button.dart';
import 'package:bubble_tea/widgets/drink_tile.dart';
import 'package:bubble_tea/views/tea_details_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // onTap naviguer vers la page de détails du tea
  void navigateToTeaDetails(int index) {
    // récupérer le shop et son menu
    final shop = context.read<Shop>();
    final drinkMenu = shop.drinkMenu;
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
    // récupérer le shop et son menu
    final shop = context.read<Shop>();
    final drinkMenu = shop.drinkMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[900],
        elevation: 0,
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text('Bubble Tea'),
        actions: [
          // bouton panier
          IconButton(
              onPressed: () {
                //Navigator.pushNamed(context, '/cartpage');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartPage()));
              },
              icon: const Icon(
                Icons.shopping_cart,
              ))
        ],
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
                  'lib/assets/images/bt_main.png',
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
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 45),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // image
                    Image.asset(
                      'lib/assets/images/bt_pink.png',
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

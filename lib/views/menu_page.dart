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

  // favorite button
  var _favoriteIcon = const Icon(Icons.favorite_outline_rounded);
  var _favIconColor = Colors.grey;
  bool _favIconStatus = false;

  // drawer settings
  int _drawerIndex = 0;
  Color? _currentMode = lightMode;

  // onTap drawer
  void _onItemTapped(int index) {
    setState(() {
      _drawerIndex = index;
      if (_currentMode == lightMode) {
        _currentMode = nightMode;
      } else {
        _currentMode = lightMode;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // récupérer le shop et son menu
    final shop = context.read<Shop>();
    final drinkMenu = shop.drinkMenu;
    return Scaffold(
      backgroundColor: _currentMode,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[900],
        elevation: 0,
        title: const Text("BOB'BLES"),
        actions: [
          // bouton panier
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartPage()));
              },
              icon: const Icon(
                Icons.shopping_cart,
              ))
        ],
      ),
      drawer: Drawer(
        backgroundColor: mainColor,
        width: 200,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: secondaryColor,
              ),
              child: Center(
                  child: Text(
                'Settings',
                style: TextStyle(color: textColor),
              )),
            ),
            ListTile(
              title: Text(
                'Nightmode',
                style: TextStyle(color: textColor),
              ),
              selected: _drawerIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      'Earn 15% Discount !!!',
                      style: GoogleFonts.anton(
                        fontSize: 18,
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
                  height: 120,
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
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
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
            ),
          ),

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
                color: _currentMode, borderRadius: BorderRadius.circular(20)),
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
                IconButton(
                  color: _favIconColor,
                  iconSize: 28,
                  onPressed: () {
                    if (_favIconStatus == false) {
                      _favoriteIcon = const Icon(Icons.favorite_rounded);
                      _favIconColor = Colors.red;
                      _favIconStatus = true;
                    } else {
                      _favoriteIcon =
                          const Icon(Icons.favorite_outline_rounded);
                      _favIconColor = Colors.grey;
                      _favIconStatus = false;
                    }
                  },
                  icon: _favoriteIcon,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

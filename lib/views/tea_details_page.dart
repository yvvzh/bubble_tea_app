import 'package:bubble_tea/models/shop.dart';
import 'package:bubble_tea/models/tea.dart';
import 'package:bubble_tea/themes/colors.dart';
import 'package:bubble_tea/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeaDetailsPage extends StatefulWidget {
  final Tea tea;
  const TeaDetailsPage({super.key, required this.tea});

  @override
  State<TeaDetailsPage> createState() => _TeaDetailsPageState();
}

class _TeaDetailsPageState extends State<TeaDetailsPage> {
  // compteur de quantité
  int qtyCount = 0;

  // décrémenteur
  void decrementQuantity() {
    if (qtyCount > 0) {
      setState(() {
        qtyCount--;
      });
    }
  }

  // incrémenteur
  void incrementQuantity() {
    setState(() {
      qtyCount++;
    });
  }

  // ajouter au panier
  void addToCart() {
    if (qtyCount > 0) {
      // accès au shop
      final shop = context.read<Shop>();

      // ajout au cart
      shop.addToCart(widget.tea, qtyCount);

      // notifier l'utilisateur
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: mainColor,
          content: Text(
            "Successfully added to cart!",
            style: GoogleFonts.anton(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          actions: [
            // bouton ok
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.done,
                color: Colors.white,
              ),
            ),

            // bouton annuler
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          // listview tea details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  // image
                  Image.asset(
                    widget.tea.imgPath,
                    height: 200,
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  // étoiles
                  Row(
                    children: [
                      // icone favoris
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),

                      const SizedBox(width: 5),

                      // note
                      Text(
                        widget.tea.stars,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // nom du tea
                  Text(
                    widget.tea.name,
                    style: GoogleFonts.anton(fontSize: 28),
                  ),

                  const SizedBox(height: 25),
                  // description
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Freshly squeezed watermelon mixed with delicate white tea and tasty vanilla bubbles 🥰",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // prix/quantité et ajouter au panier
          Container(
            color: mainColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                // prix et quantité
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // prix
                    Text(
                      widget.tea.price + '€',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    // quantité
                    Row(
                      children: [
                        // bouton -
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: decrementQuantity,
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        // compteur de quantité
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              qtyCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        // bouton +
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: incrementQuantity,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(
                  height: 25,
                ),
                // bouton ajouter au panier
                MyButton(text: "Add To Cart", onTap: addToCart),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

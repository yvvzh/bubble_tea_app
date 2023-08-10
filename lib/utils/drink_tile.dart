import 'package:bubble_tea/models/tea.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrinkTile extends StatelessWidget {
  final Tea tea;
  final void Function()? onTap;

  const DrinkTile({super.key, required this.tea, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.only(left: 25),
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // image
            Image.asset(
              tea.imgPath,
              height: 140,
            ),
            // nom
            Text(
              tea.name,
              style: GoogleFonts.anton(fontSize: 20),
            ),
            // prix et étoiles
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // prix
                  Text(
                    tea.price + '€',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey[700]),
                  ),

                  // étoiles
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      Text(
                        tea.stars,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

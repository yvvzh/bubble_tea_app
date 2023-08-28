import 'package:bubble_tea/models/shop.dart';
import 'package:bubble_tea/models/tea.dart';
import 'package:bubble_tea/themes/colors.dart';
import 'package:bubble_tea/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // retirer du panier
  void removeFromCart(Tea tea, BuildContext context) {
    // accès au shop
    final shop = context.read<Shop>();

    // retirer du panier
    shop.removeFromCart(tea);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: mainColor,
        appBar: AppBar(
          title: const Text("My Cart"),
          backgroundColor: mainColor,
          elevation: 0,
        ),
        body: Column(
          children: [
            // panier client
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  // récupère le panier
                  final Tea tea = value.cart[index];

                  // récupère le nom du tea
                  final String teaName = tea.name;

                  // récupère le prix du tea
                  final String teaPrice = tea.price;

                  // retourne la list tile
                  return Container(
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: ListTile(
                      title: Text(
                        teaName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        teaPrice,
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => removeFromCart(tea, context),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.grey[200],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // bouton payer
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(
                text: "Pay Now",
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}

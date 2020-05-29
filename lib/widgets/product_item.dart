import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../screens/product_detail_screen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';
import '../providers/auth.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);
    return Container(
      //decoration: new BoxDecoration(color: Colors.blue),


      child: ClipRRect(


        borderRadius: BorderRadius.circular(10),
        child: GridTile(

          child: GestureDetector(



            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: product.id,
              );
            },


        /*    child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),

         */
        child:Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
decoration: BoxDecoration(
  image: DecorationImage(image : AssetImage("assets/images/pink.jpg"),
  fit: BoxFit.cover
),),
//color: Colors.grey,



            child: Column(

              children: [



                Text(

                  product.id,

                  textAlign: TextAlign.center,

                ),
                Text(
                  product.title,
                  textAlign: TextAlign.center,
                ),
                Text(
                  product.price.toInt().toString(),
                  textAlign: TextAlign.center,
                ),



              ],



            ),

        )
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: Consumer<Product>(
              builder: (ctx, product, _) => IconButton(
                icon: Icon(
                  product.isFavorite ? Icons.bookmark : Icons.bookmark_border,
                ),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  product.toggleFavoriteStatus(
                    authData.token,
                    authData.userId,
                  );
                },
              ),
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.add,
              ),
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Added item to cart!',
                    ),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        cart.removeSingleItem(product.id);
                      },
                    ),
                  ),
                );
              },
              color: Theme.of(context).accentColor,
            ),
          ),
        ),

      ),

    );
  }
}


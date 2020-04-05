import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/edit_product_screen.dart';
import '../providers/products_provider.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageurl;
  final String id;

  UserProductItem(
    this.id,
    this.title,
    this.imageurl,
  );

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageurl),
      ),
       trailing:  IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                try {
                  await Provider.of<ProductsProviders>(context, listen: false)
                      .deleteproduct(id);
                } catch (error) {
                  scaffold.showSnackBar(
                    SnackBar(
                      content: Text(
                        'Deletion Falied',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
              },
              color: Theme.of(context).errorColor,
            )
      // Container(
      //   width: 100,
      //   child: Row(
      //     children: <Widget>[
      //       // IconButton(
      //       //     icon: Icon(Icons.edit),
      //       //     onPressed: () {
      //       //       Navigator.of(context)
      //       //           .pushNamed(EditProductScreen.routeName, arguments: id);
      //       //     },
      //       //     color: Theme.of(context).primaryColor),
      //       IconButton(
      //         icon: Icon(Icons.delete),
      //         onPressed: () async {
      //           try {
      //             await Provider.of<ProductsProviders>(context, listen: false)
      //                 .deleteproduct(id);
      //           } catch (error) {
      //             scaffold.showSnackBar(
      //               SnackBar(
      //                 content: Text(
      //                   'Deletion Falied',
      //                   textAlign: TextAlign.center,
      //                 ),
      //               ),
      //             );
      //           }
      //         },
      //         color: Theme.of(context).errorColor,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

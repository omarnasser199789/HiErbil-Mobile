import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class FavWidget extends StatelessWidget {
  const FavWidget({Key? key, this.bgColor}) : super(key: key);
  final Color ? bgColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color:bgColor?? Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(size.width),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FavoriteButton(
          iconSize: 35,
          valueChanged: (_isFavorite) {
            print('Is Favorite $_isFavorite)');
          },
        ),
      ),
    );
  }
}

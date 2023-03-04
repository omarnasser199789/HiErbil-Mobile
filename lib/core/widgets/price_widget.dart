import 'package:flutter/material.dart';

import '../../Theme/style.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key,required this.newPrice,required this.price}) : super(key: key);
  final double price;
  final double newPrice;

  @override
  Widget build(BuildContext context) {
    return   (newPrice==0)?
    ///We must show the price (without discount)
    (price!=0)?
    Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Text("\$${price.toInt()}",
          style: blackBoldTextStyle(context: context,
              fontSize: 18)),
    ):
    Text("مجانا",
        style: blackBoldTextStyle(context: context,
            fontSize: 18,color: Theme.of(context).primaryColor))
    ///There is a discount on the price
        :
    ///We must show the new price and old price
    Row(
      children: [
        (newPrice!=0)?
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Text("\$${newPrice}",
              style: blackBoldTextStyle(context: context,
                  fontSize: 18)),
        ):  Text("مجانا",
            style: blackBoldTextStyle(context: context,
                fontSize: 18,color: Theme.of(context).primaryColor)),

        const SizedBox(
          width: 23,
        ),

        if(price.toInt()!=0)
          Stack(
            // alignment: Alignment.center,
            children: [

              Padding(
                padding:
                const EdgeInsets.only(top: 0),
                child: Text("\$${price.toInt()}",
                    style: blackRegularTextStyle(
                        fontSize: 18)),
              ),
              Padding(
                padding:
                const EdgeInsets.only(top: 10),
                child: Container(
                  width: 40,
                  height: 2,
                  color: Colors.grey,
                ),
              )
            ],
          ),


      ],
    );
  }
}

// import 'package:flutter/material.dart';
//
//
//
//
// class FavButton extends StatefulWidget {
//   const FavButton({super.key});
//
//   @override
//   State<FavButton> createState() => _FavButtonState();
// }
//
// class _FavButtonState extends State<FavButton> {
//   double _size = 40.0;
//   bool _large = false;
//
//   void _updateSize() {
//     setState(() {
//       _size = _large ? 100 : 40.0;
//       _large = !_large;
//
//
//     });
//     Future.delayed(const Duration(milliseconds: 500), () {
//       setState(() {
//         _size = _large ? 100 : 40.0;
//         _large = !_large;
//       });
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => _updateSize(),
//       child: Container(
//
//         width: 110,
//         height: 110,
//         // alignment: Alignment.center,
//         color: Colors.amberAccent,
//         child: Center(
//           child: AnimatedSize(
//             curve: Curves.easeIn,
//             duration: const Duration(seconds: 1),
//             // child: FlutterLogo(size: _size),
//             child: Container(
//               width: _size,
//               height: _size,
//               color: Colors.red,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

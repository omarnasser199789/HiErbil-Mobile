//
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//
// import 'common.dart';
//
// class MasonryPage extends StatelessWidget {
//   const MasonryPage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MasonryGridView.count(
//       crossAxisCount: 3,
//       mainAxisSpacing: 10,
//       crossAxisSpacing: 10,
//       itemBuilder: (context, index) {
//         return Stack(
//           children: [
//             Tile(
//               index: index,
//               extent: (index % 5 + 1) * 100,
//             ),
//             Text("Title"),
//           ],
//         );
//       },
//     );
//   }
// }
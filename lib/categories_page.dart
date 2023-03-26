import 'package:flutter/material.dart';
import 'features/home/presentation/widgets/category_section.dart';
import 'core/widgets/app_bar_type3.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidgetType3("Categories",context,true,[],null),
      body: Padding(
        padding: const EdgeInsets.only(top:10),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20), )
          ),
          child:        Padding(
            padding: const EdgeInsets.only(left: 17,right: 17),
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  CategorySection(),
                  CategorySection(),
                  SizedBox(height: 30,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

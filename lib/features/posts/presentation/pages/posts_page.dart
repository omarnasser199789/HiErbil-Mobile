
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_erbil_mobile/Theme/style.dart';
import 'package:hi_erbil_mobile/core/widgets/app_bar_type3.dart';
import 'package:hi_erbil_mobile/core/widgets/cached_net_work_image.dart';
import 'package:hi_erbil_mobile/features/posts/presentation/bloc/posts_bloc.dart';
import '../../../../core/globals.dart';
import '../../../../core/widgets/waiting_widget.dart';
import '../../../home/presentation/widgets/global_style.dart';
import '../../../../injection_container.dart';
import '../widgets/posts_style.dart';
import '../bloc/posts_event.dart';
import '../bloc/posts_state.dart';



class PostsPage extends StatefulWidget {
  PostsPage({Key? key, required this.title}) : super(key: key);
  final String title;


  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage>  with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isExpanded = true;
  bool selected = true;

  List<Widget> tabs = [];

  List<Widget> tabBarViewList = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    // Delay execution of _toggleContainer by 1 second
    Future.delayed(Duration(milliseconds: 100), () {
      _toggleContainer();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleContainer() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;

    return BlocProvider(
        create: (BuildContext context) => sl<PostsBloc>(),
        child: BlocBuilder<PostsBloc, PostState>(builder: (context, state) {
          if (kDebugMode) {
            print("Categories State IS $state");
          }

          if (state is Empty) {
            BlocProvider.of<PostsBloc>(context).add(GetBlogCategoriesEvent());/// => SuccessGetBlogCategories
          }
          // if(state is Loading){
          //   return const WaitingWidget();
          // }

          if(state is SuccessGetBlogCategories){

              tabs = [];
              for (var item in state.params.data) {
                tabs.add(
                  Tab(
                    height: 80,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: CachedNetWorkImage(
                              borderRadius: BorderRadius.circular(10),
                              boxFit: BoxFit.fill,
                              url:(item.attachments.isNotEmpty)? s3Amazonaws+item.attachments[0].path:null,
                            ),
                          ),
                          Text(item.title, maxLines: 1),
                        ],
                      ),
                    ),
                  ),
                );



                  tabBarViewList.add( PostsStyle(posts:item.posts));





              }



          }


          return Scaffold(
            appBar: appBarWidgetType3(widget.title, context, false, [], null),
            body: Container(
              height: size.height,
              child:  Stack (
                alignment: Alignment.bottomCenter,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: _isExpanded ? 0.0 : size.height - 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    ),
                    child: DefaultTabController(
                        length: tabs.length,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 10),
                                child: TabBar(
                                  isScrollable: true,
                                  labelColor: Theme.of(context).canvasColor,
                                  unselectedLabelColor: iconsColor,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  labelStyle:
                                  poppinsRegularTextStyle(fontSize: 12, context: context),
                                  tabs: tabs,
                                ),
                              ),
                              SizedBox(
                                height: size.height - 188,
                                child: TabBarView(
                                  children: tabBarViewList,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  if(state is Loading)
                    WaitingWidget(),
                ],
              ),
            ),
          );



        }));




  }
}







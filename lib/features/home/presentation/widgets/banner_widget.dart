import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/functions.dart';
import '../../../../core/globals.dart';
import '../../../../core/widgets/cached_net_work_image.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../../../../injection_container.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget(
      {Key? key,
      required this.padding,
      required this.height,
      required this.borderRadius})
      : super(key: key);
  final EdgeInsetsGeometry padding;
  final double height;
  final BorderRadius borderRadius;

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class Items {
  Items({required this.image, required this.id});
  String image;
  int id;
}

class _BannerWidgetState extends State<BannerWidget> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    List<Items> list = [Items(image: '', id: 1), Items(image: '', id: 2)];

    return BlocProvider(
        create: (BuildContext context) => sl<HomeBloc>(),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (kDebugMode) {
            print("State IS $state");
          }

          if (state is Empty) {
            BlocProvider.of<HomeBloc>(context).add(GetBannersEvent());
          }

          if( state is SuccessGetBanners){
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  height: widget.height,
                  width: double.infinity,
                  child: CarouselSlider(
                    items: state.bannersEntity.data.map(
                          (e) => Column(
                        children: [
                          Padding(
                            padding: widget.padding,
                            child: GestureDetector(
                              onTap: () async {
                                // if (await canLaunch(e.linkUrl)) {
                                //   await launch(e.linkUrl);
                                // } else {
                                //   showMessage(message: "حدث خطا اثناء تنفيذ العملية", context: context);
                                // }
                                // setState(() {
                                //
                                // });
                              },
                              child: SizedBox(
                                height: widget.height,
                                child: CachedNetWorkImage(
                                  borderRadius: widget.borderRadius,
                                  boxFit: BoxFit.cover,
                                  url:  (e.attachments.isNotEmpty)? s3Amazonaws+e.attachments[0].path:null,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                        .toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      height: widget.height,
                      enableInfiniteScroll: false,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          selectedIndex = list[index].id;
                        });
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: state.bannersEntity.data
                        .map(
                          (e) => AnimatedContainer(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        duration: const Duration(milliseconds: 200),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            color: selectedIndex == e.id
                                ? Theme.of(context).primaryColor
                                : Theme.of(context)
                                .primaryColor
                                .withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )
                        .toList(),
                  ),
                ),
              ],
            );
          }


          return Container();

        }));
  }
}
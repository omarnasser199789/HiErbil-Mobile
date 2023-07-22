import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:extended_image/extended_image.dart';

class CachedNetWorkImage extends StatefulWidget {
  const CachedNetWorkImage({Key? key ,this.padding, this.url,this.border,required this.borderRadius,this.boxFit}) : super(key: key);

  final String ?url;
  final BoxFit ?boxFit;
  final BorderRadius borderRadius;
  final  BoxBorder ? border;
  final  EdgeInsetsGeometry ? padding;
  @override
  State<CachedNetWorkImage> createState() => _CachedNetWorkImageState();
}

class _CachedNetWorkImageState extends State<CachedNetWorkImage> {


  static const key = 'customCacheKey';
  static final customCacheManager = CacheManager(
      Config(
        key,
        stalePeriod: const Duration(days: 15),
        maxNrOfCacheObjects: 500,
        repo: JsonCacheInfoRepository(databaseName: key),
        // fileSystem: LocalCacheFileSystem(key),
        fileService: HttpFileService(),
        //one week cache period
      ));

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:widget.borderRadius,
      child: Padding(
        padding: (widget.padding!=null)?widget.padding!:EdgeInsets.zero,
        child: CachedNetworkImage(
            key: UniqueKey(),
            filterQuality: FilterQuality.none,
            cacheManager: customCacheManager,
            imageUrl: (widget.url!=null)?widget.url!.replaceFirst("https","http"):"https://i.redd.it/70zvc38gfxv71.jpg",
            imageBuilder: (context, imageProvider) => Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit:(widget.boxFit!=null)? widget.boxFit:BoxFit.contain,
                ),
                border: widget.border,
                borderRadius:widget.borderRadius,
              ),
            ),
            placeholder: (context, url) => Center(
              child:
              Shimmer.fromColors(
                baseColor:Theme.of(context).cardColor,
                highlightColor:  const Color.fromRGBO(119, 118, 118, 0.5490196078431373),
                child:  Container(
                  color: Theme.of(context).cardColor,
                  width: double.infinity,
                  // height:100 ,
                )
              ),
            ),
            errorWidget: (context, url, error) =>
                 const Center(child:
                // SvgPicture.asset(
                // "assets/svgs/error-image.svg",
                //   color: Colors.red,
                // ),

                Icon(Icons.error,color: Colors.red,)
                )),
      ),
    );
  }
}


// class CachedNetWorkImage extends StatelessWidget {
//   const CachedNetWorkImage({Key? key,this.url,this.boxFit,this.border,this.borderRadius,this.padding}) : super(key: key);
//   final String ?url;
//   final BoxFit ?boxFit;
//   final BorderRadius ? borderRadius;
//   final  BoxBorder ? border;
//   final  EdgeInsetsGeometry ? padding;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:(padding!=null)?padding!:EdgeInsets.zero,
//       child: Container(
//         decoration: BoxDecoration(
//           border: border,
//           borderRadius: borderRadius,
//         ),
//         child: ExtendedImage.network(
//           (url!=null)?url!.replaceFirst("https","http"):"https://i.redd.it/70zvc38gfxv71.jpg",
//           cacheHeight: 500,
//           border: border,
//           borderRadius: borderRadius,
//
//           filterQuality: FilterQuality.none,
//           fit: BoxFit.cover,//
//           cache: true, // store in cache
//           enableMemoryCache: true, // do not store in memory
//           enableLoadState: true, // hide spinner
//         ),
//       ),
//     );
//   }
// }

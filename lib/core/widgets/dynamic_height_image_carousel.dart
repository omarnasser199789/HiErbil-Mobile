import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';
import '../classes/attachment.dart';
import '../globals.dart';

class DynamicHeightImageCarousel extends StatefulWidget {
  final List<Attachment> attachments;
  final Size size;

  DynamicHeightImageCarousel({
    required this.attachments,
    required this.size,
  });

  @override
  _DynamicHeightImageCarouselState createState() =>
      _DynamicHeightImageCarouselState();
}

class _DynamicHeightImageCarouselState extends State<DynamicHeightImageCarousel> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CarouselSlider.builder(
      itemCount: widget.attachments.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        final e = widget.attachments[index];
        return GestureDetector(
          onTap: (){
            _showImageDialog(context, e,size);
          },
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl:s3Amazonaws + e.path,
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        enableInfiniteScroll: false,
        viewportFraction: widget.size.height * 0.28 / widget.size.width, // Adjust the viewportFraction
        onPageChanged: (index, reason) {
          setState(() {
            selectedIndex = widget.attachments[index].id;
          });
        },
      ),
    );
  }

  void _showImageDialog(BuildContext context, Attachment attachment, Size size) {
    showDialog(
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Container(
              color: Colors.black.withOpacity(0.3),
              width: size.width,
              child: Dialog(
                  backgroundColor:Colors.black.withOpacity(0.0),
                child: PhotoView(
                  imageProvider: CachedNetworkImageProvider(s3Amazonaws + attachment.path),
                  backgroundDecoration: BoxDecoration(color: Colors.black.withOpacity(0.0)),
                  initialScale: PhotoViewComputedScale.contained,
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered * 2, // Adjust the max scale factor as needed.
                  heroAttributes: PhotoViewHeroAttributes(tag: attachment.id.toString()),
                ),
              ),
            ),
            ElevatedButton(onPressed: () { Navigator.pop(context);}, child: Icon(Icons.cancel),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).cardColor, // Change the background color
                onPrimary: Colors.white, // Change the text (icon) color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Adjust the button's border radius
                ),
              ),
            ),
          ],
        );
      },
    );
  }

}

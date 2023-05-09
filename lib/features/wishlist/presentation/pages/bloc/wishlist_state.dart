





import 'package:hi_erbil_mobile/features/posts/domain/entities/post_entity.dart';

import '../../../domain/entities/wishlist_entity.dart';


abstract class WishlistState {}

class PatientsInitial extends WishlistState {}

class Loading extends WishlistState {}
class SuccessAddToWishlist extends WishlistState {}
class SuccessDeleteFromFav extends WishlistState {}
class SuccessGetWishlist extends WishlistState {
  List<WishlistEntity> wishlistEntity;
  SuccessGetWishlist({required this.wishlistEntity});
}
class SuccessGetIsFav extends WishlistState {
  int fav;
  SuccessGetIsFav({required this.fav});
}



class SuccessGetPost extends WishlistState {
  PostEntity params;
  SuccessGetPost({required this.params});
}






class Error extends  WishlistState {
  final String message;

  Error({ required this.message}); //we use this constructor in ((BLOC & test))

  @override
  List<Object> get props => [message];
}

class Empty extends  WishlistState {}

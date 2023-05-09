

import '../../../domain/usecase/add_to_wishlist_usecase.dart';

abstract class WishlistEvent {}







class GetBlogCategoriesEvent extends WishlistEvent {}

class AddToWishlistEvent extends WishlistEvent {
  AddProductToFavParams params;
  AddToWishlistEvent({required this.params});
}

class GetWishlistEvent extends WishlistEvent {}
class IsFavEvent extends WishlistEvent {
  int id;
  IsFavEvent({required this.id});
}
class DeleteFromFavEvent extends WishlistEvent {
  int id;
  DeleteFromFavEvent({required this.id});
}




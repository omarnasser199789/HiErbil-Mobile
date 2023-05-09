
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/wishlist_repository.dart';


class AddToWishlistUseCase implements UseCase<int, AddProductToFavParams> {
  final WishlistRepository repository;
  AddToWishlistUseCase({required this.repository});

  @override
  Future<Either<Failure,int>> call(AddProductToFavParams params) {

    return repository.addProductToFav(params);
  }
}

class AddProductToFavParams{
  final int apiId;
  final String title;
  final String  image;


  const   AddProductToFavParams({
    required this.apiId,
    required this.title,
    required this.image
  });

  // Convert a DogModel into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {

      'apiId': apiId,
      'title': title,
      'image': image,

    };
  }

  // Implement toString to make it easier to see information about
  // each DogModel when using the print statement.
  @override
  String toString() {
    return 'product{apiId:$apiId, title: $title, image: $image}';
  }
}
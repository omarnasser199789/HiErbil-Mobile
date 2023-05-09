





import 'package:hi_erbil_mobile/features/posts/domain/entities/post_entity.dart';

import '../../domain/entities/blog_categories_entity.dart';

abstract class PostState {}

class PatientsInitial extends PostState {}

class Loading extends PostState {}
class SuccessGetBlogCategories extends PostState {
  BlogCategoriesEntity params;
  SuccessGetBlogCategories({required this.params});
}

class SuccessGetPost extends PostState {
  PostEntity params;
  SuccessGetPost({required this.params});
}






class Error extends  PostState {
  final String message;

  Error({ required this.message}); //we use this constructor in ((BLOC & test))

  @override
  List<Object> get props => [message];
}

class Empty extends  PostState {}

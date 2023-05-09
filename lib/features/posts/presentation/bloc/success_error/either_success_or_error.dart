import 'package:dartz/dartz.dart';
import 'package:hi_erbil_mobile/features/posts/domain/entities/post_entity.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/globals.dart';
import '../../../domain/entities/blog_categories_entity.dart';
import '../posts_state.dart';


Stream<PostState> SuccessGetBlogCategoriesOrErrorState(
  Either<Failure, BlogCategoriesEntity> failureOrSuccess,
) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (params) => SuccessGetBlogCategories(params:params),
  );
}

Stream<PostState> SuccessGetPostOrErrorState(
  Either<Failure, PostEntity> failureOrSuccess,
) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (params) => SuccessGetPost(params:params),
  );
}



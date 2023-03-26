import 'package:dartz/dartz.dart';

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



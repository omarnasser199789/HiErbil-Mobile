import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_erbil_mobile/features/posts/presentation/bloc/success_error/either_success_or_error.dart';
import '../../domain/usecase/get_blog_categories_usecase.dart';
import 'bloc.dart';

class PostsBloc extends Bloc<PostsEvent, PostState> {
  final GetBlogCategoriesUseCase getBlogCategoriesUseCase;





  PostsBloc({
    required GetBlogCategoriesUseCase concreteGetBlogCategoriesUseCase,





  })  : assert(
  concreteGetBlogCategoriesUseCase != null,
        ),
        getBlogCategoriesUseCase = concreteGetBlogCategoriesUseCase,




        super(Empty());

  @override
  Stream<PostState> mapEventToState(PostsEvent event) async* {

    if(event is GetBlogCategoriesEvent){
      yield Loading();
      final failureOrPhysician = await getBlogCategoriesUseCase("");
      yield* SuccessGetBlogCategoriesOrErrorState(failureOrPhysician);
    }



  }
}

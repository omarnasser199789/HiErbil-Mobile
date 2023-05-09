import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_erbil_mobile/features/posts/presentation/bloc/success_error/either_success_or_error.dart';
import '../../domain/usecase/get_blog_categories_usecase.dart';
import '../../domain/usecase/get_post_useccacse.dart';
import 'bloc.dart';

class PostsBloc extends Bloc<PostsEvent, PostState> {
  final GetBlogCategoriesUseCase getBlogCategoriesUseCase;
  final GetPostByIdUseCase getPostByIdUseCaseUseCase;





  PostsBloc({
    required GetBlogCategoriesUseCase concreteGetBlogCategoriesUseCase,
    required GetPostByIdUseCase concreteGetPostByIdUseCase,





  })  : assert(
  concreteGetBlogCategoriesUseCase != null,
        ),
        getBlogCategoriesUseCase = concreteGetBlogCategoriesUseCase,
        getPostByIdUseCaseUseCase = concreteGetPostByIdUseCase,




        super(Empty());

  @override
  Stream<PostState> mapEventToState(PostsEvent event) async* {

    if(event is GetBlogCategoriesEvent){
      yield Loading();
      final failureOrPhysician = await getBlogCategoriesUseCase("");
      yield* SuccessGetBlogCategoriesOrErrorState(failureOrPhysician);
    }
    if(event is GetPostEvent){
      yield Loading();
      final failureOrPhysician = await getPostByIdUseCaseUseCase(event.id);
      yield* SuccessGetPostOrErrorState(failureOrPhysician);
    }



  }
}

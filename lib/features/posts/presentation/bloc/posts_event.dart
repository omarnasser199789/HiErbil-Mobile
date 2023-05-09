

abstract class PostsEvent {}







class GetBlogCategoriesEvent extends PostsEvent {}

class GetPostEvent extends PostsEvent {
  int id;
  GetPostEvent({required this.id});
}




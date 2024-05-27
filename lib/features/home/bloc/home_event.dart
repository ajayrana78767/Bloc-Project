part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeProductWithlistButtonClickedEvent extends HomeEvent{

}
class HomeProductCartButtonClickedEvent extends HomeEvent{
  
}
class HomeWishlistButtonNavigateEvent extends HomeEvent{
  
}
class HomeCartButtonNavigateEvent extends HomeEvent{
  
}


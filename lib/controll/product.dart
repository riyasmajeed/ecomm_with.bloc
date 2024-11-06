import 'package:ecommewithbloc/mode/model.dart';
import 'package:equatable/equatable.dart';


abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<Product> products;

  ProductLoadedState(this.products);

  @override
  List<Object> get props => [products];
}

class ProductErrorState extends ProductState {
  final String message;

  ProductErrorState(this.message);

  @override
  List<Object> get props => [message];
}

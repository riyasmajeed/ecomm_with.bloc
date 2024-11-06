import 'package:ecommewithbloc/controll/apiservice.dart';
import 'package:ecommewithbloc/controll/bloc.dart';
import 'package:ecommewithbloc/controll/product.dart';
import 'package:ecommewithbloc/mode/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ApiService apiService;

  ProductBloc({required this.apiService}) : super(ProductLoadingState()) {
    on<FetchProductsEvent>(_onFetchProducts);
  }

  void _onFetchProducts(FetchProductsEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());
    try {
      final List<Product> products = await apiService.fetchProducts();
      emit(ProductLoadedState(products));
    } catch (e) {
      emit(ProductErrorState("Failed to load products"));
    }
  }
}

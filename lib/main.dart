import 'package:ecommewithbloc/controll/apiservice.dart';
import 'package:ecommewithbloc/controll/bloc.dart';
import 'package:ecommewithbloc/controll/productbloc.dart';
import 'package:ecommewithbloc/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ProductBloc(apiService: ApiService())..add(FetchProductsEvent()),
        child: HomePage(),
      ),
    );
  }
}

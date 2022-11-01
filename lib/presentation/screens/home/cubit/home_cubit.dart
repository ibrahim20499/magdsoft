import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft/constants/end_points.dart';
import 'package:magdsoft/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft/data/models/product_model.dart';
import 'package:magdsoft/data/models/help_model.dart';
import 'package:meta/meta.dart';
import 'package:magdsoft/presentation/styles/assets_manager.dart';

import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  List companies = [
    ['All', ImageAssets.cupLogo],
    ['Acer', ImageAssets.predatorTlcsLogo],
    ['Apple', ImageAssets.iosLogo],
    ['Razer', ImageAssets.razerLogo],
  ];
  List<Widget> tabBar = [
    Tab(
      text: 'Overview',
    ),
    Tab(
      text: 'Spesification',
    ),
    Tab(
      text: 'Review',
    ),
  ];
  late GetProductsModel getProductsModel;
  List<ProductsModel> products=[];
  void getProducts() {
    emit(ProductsDataLodaing());
    DioHelper.getData(
      url: EndPoints.getProducts,
      query: {},
    ).then((value) {
      getProductsModel = GetProductsModel.fromJson(value.data);
      getProductsModel.products!.forEach(((element) => products.add(element)));
      emit(ProductsDataLoaded());
    }).catchError((error) {
      print(error.toString());
      emit(ProductsDataError(message: error.toString()));
    });
  }

  late GetHelpModel getHelpModel;
  List<HelpModel> help = [];
  void getHelp() {
    emit(HelpDataLodaing());
    DioHelper.getData(
      url: EndPoints.getHelp,
      query: {},
    ).then((value) {
      getHelpModel = GetHelpModel.fromJson(value.data);
      getHelpModel.help!.forEach(((element) => help.add(element)));
      emit(HelpDataLoaded());
    }).catchError((error) {
      print(error.toString());
      emit(HelpDataError(message: error.toString()));
    });
  }
}

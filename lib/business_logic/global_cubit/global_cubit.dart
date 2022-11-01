import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'global_state.dart';


class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  int index = 0;
  updateScreen(value) {
    index = value;
    emit(UpdateBottomNavigationBar());
  }

  List<IconData> bIcons = const [
    Icons.home_outlined,
    Icons.favorite,
    Icons.notifications_rounded,
    Icons.logout_rounded,
  ];


}

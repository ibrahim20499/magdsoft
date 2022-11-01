import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft/presentation/screens/help/help_screen.dart';
import 'package:magdsoft/presentation/screens/home/home_screen.dart';
import 'package:magdsoft/presentation/screens/login/login_screen.dart';
import 'package:magdsoft/presentation/widget/bottom_nav_bar.dart';
import 'package:magdsoft/presentation/screens/login/verify_phone.dart';


class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          GlobalCubit cubit = GlobalCubit.get(context);
          return Scaffold(
            bottomNavigationBar: BottomNavigationBarWidget(
              itemIcons: cubit.bIcons,
              selectedIndex: cubit.index,
              onItemPressed: (value) {
                cubit.updateScreen(value);
              },
            ),
            body: HomeScreen(),
          );
        });
  }
}
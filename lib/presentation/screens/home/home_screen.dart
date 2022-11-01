import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/home/cubit/home_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/home/product_details_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/app_color.dart';
import 'package:magdsoft_flutter_structure/presentation/view/categories.dart';
import 'package:magdsoft_flutter_structure/presentation/view/product_card.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColor.primary.withOpacity(0.85),
                    AppColor.primary.withOpacity(0),
                    AppColor.primary.withOpacity(0),
                  ]),
            ),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                      child: Container(
                          //padding: EdgeInsets.all(90),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(2, 2),
                                  blurRadius: 8.0,
                                  spreadRadius: 3, // Shadow position
                                ),
                              ]),
                          width: 300,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.search,
                                size: 23,
                                color: Color(0xffB1B1B1),
                              ),
                              hintText: "Search",
                              hintStyle: TextStyle(
                                color: Color(0xffB1B1B1),
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              fillColor: Color(0xffFFFFFF),
                              filled: true,
                            ),

                            keyboardType: TextInputType.text,
                            // style: Theme.of(context).textTheme.headline6,
                          )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(2, 2),
                              blurRadius: 5,
                              spreadRadius: 5, // Shadow position
                            ),
                          ]),
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.filter_alt_rounded,
                        color: Color(0xffB1B1B1),
                        size: 28,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 10, bottom: 8),
                      height: 176,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(2, 2),
                              blurRadius: 8.0,
                              spreadRadius: 4, // Shadow position
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage("assets/images/acer.png"),
                            fit: BoxFit.fill,
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RichText(
                              //textAlign: TextAlign.left,
                              text: TextSpan(children: [
                            TextSpan(
                              text: "New Release \n",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                            TextSpan(
                              text: "Acer Predator Helios 300",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ])),
                        ],
                      )),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 9.6.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    shrinkWrap: true,
                    itemCount: cubit.companies.length,
                    itemBuilder: (context, index) {
                      return CategoriesCardItem(
                        image: cubit.companies[index][1],
                        name: cubit.companies[index][0],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                state is ProductsDataLodaing
                    ? SizedBox(
                        height: 25.h,
                        child: const Center(child: CircularProgressIndicator()))
                    : ProductsList(cubit: cubit),
              ],
            ),
          );
        });
  }
}

class ProductsList extends StatelessWidget {
  const ProductsList({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
      child: SizedBox(
        //height: 33.h * ((cubit.products.length / 2).ceil()) + 23.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40.w,
                  height: 12.h,
                  child: Text(
                    "Recomended for You",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        color: Color(0XFF464646),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 1.w),
                  child: SizedBox(
                    width: 41.w,
                    height: 33.h * (cubit.products.length / 2),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cubit.products.length,
                      itemBuilder: (context, index) {
                        if (cubit.products[index].id % 2 == 0) {
                          return ProductCard(
                            onTap: () {
                              //id = index;
                              Navigator.pushReplacementNamed(
                                  context, Routes.productDetailsRoute);
                            },
                            image: cubit.products[index].image,
                            description: cubit.products[index].company,
                            name: cubit.products[index].name,
                            price: cubit.products[index].price,
                          );
                        } else {
                          return SizedBox(
                            height: 1.h,
                          );
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
            SizedBox(
                width: 41.w,
                height: 33.h * (cubit.products.length / 2),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cubit.products.length,
                  itemBuilder: (context, index) {
                    if (cubit.products[index].id % 2 == 1) {
                      return ProductCard(
                        onTap: () {
                          //cubit.products[index].id = index;
                          final id= index;
                          Navigator.pushReplacementNamed(
                              context, Routes.productDetailsRoute);
                        },
                        image: cubit.products[index].image,
                        description: cubit.products[index].company,
                        name: cubit.products[index].name,
                        price: cubit.products[index].price,
                      );
                    } else {
                      return SizedBox(
                        height: 1.h,
                      );
                    }
                  },
                ),),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

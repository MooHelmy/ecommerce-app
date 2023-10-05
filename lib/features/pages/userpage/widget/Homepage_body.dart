import 'package:e_commapp/const/constants.dart';
import 'package:e_commapp/core/widget/custm_grid.dart';
import 'package:e_commapp/cubit/cubit/serviceproudct_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../Data/models/proudct_model.dart';
import '../../../../core/widget/Custom_appBar.dart';

class Homepage_body extends StatefulWidget {
  const Homepage_body({super.key});

  @override
  State<Homepage_body> createState() => _Homepage_bodyState();
}

class _Homepage_bodyState extends State<Homepage_body> {
  int position = 0;
  List<proudct_model> Category = [];
  List<String> Categorynames = [kjackets, kshoes, ktshirts, ktrouser];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<proudct_model> listcategory;

    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Stack(children: [
        DefaultTabController(
          length: 4,
          child: BlocConsumer<AddproudctCubit, AddproudctState>(
            listener: (context, state) {
              if (state is Addproudcsuccess) {
                listcategory = state.prodctlist;
                for (var proudct in listcategory) {
                  if (proudct.category == kjackets) {
                    Category.add(proudct);
                  }
                }
              }
            },
            builder: (context, state) {
              return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    bottom: TabBar(
                        onTap: (index) {
                          setState(() {
                            position = index;
                            Category.clear();
                            if (state is Addproudcsuccess) {
                              listcategory = state.prodctlist;
                              setState(() {
                                for (var proudct in listcategory) {
                                  if (proudct.category ==
                                      Categorynames[position]) {
                                    Category.add(proudct);
                                  }
                                }
                              });
                            }
                          });
                        },
                        tabs: [
                          Text(
                            'jackets',
                            style: TextStyle(
                                fontSize: 15,
                                color:
                                    position == 0 ? Colors.black : Colors.grey),
                          ),
                          Text(
                            'shoes',
                            style: TextStyle(
                                fontSize: 15,
                                color:
                                    position == 1 ? Colors.black : Colors.grey),
                          ),
                          Text(
                            't-shirt',
                            style: TextStyle(
                                fontSize: 15,
                                color:
                                    position == 2 ? Colors.black : Colors.grey),
                          ),
                          Text(
                            'trousers',
                            style: TextStyle(
                                fontSize: 15,
                                color:
                                    position == 3 ? Colors.black : Colors.grey),
                          ),
                        ]),
                  ),
                  body: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                          decoration: const BoxDecoration(
                              color: kmainA,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: TabBarView(
                              children: [
                                custmGrid(lis_proudct: Category),
                                custmGrid(lis_proudct: Category),
                                custmGrid(lis_proudct: Category),
                                custmGrid(lis_proudct: Category),
                              ],
                            ),
                          ))));
            },
          ),
        ),
        const Material(
            child: custom_appBar(text: 'Discover', icon: Icons.shopping_cart)),
      ]),
    );
  }
}

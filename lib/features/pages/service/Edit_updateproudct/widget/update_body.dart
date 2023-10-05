import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Data/models/proudct_model.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widget/custm_text.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../../../../cubit/cubit/serviceproudct_cubit.dart';

class update_body extends StatelessWidget {
  const update_body({super.key});

  @override
  Widget build(BuildContext context) {
    String? name, price, description, category, location;
    proudct_model model =
        ModalRoute.of(context)!.settings.arguments as proudct_model;
    GlobalKey<FormState> formstate = GlobalKey();
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.defaultSize! * 20),
      child: Form(
        key: formstate,
        child: SingleChildScrollView(
          child: Column(
            children: [
              custm_text(
                hinttext: 'proudct name',
                onSaved: (data) {
                  name = data;
                },
              ),
              custm_text(
                hinttext: 'proudct price',
                onSaved: (data) {
                  price = data;
                },
              ),
              custm_text(
                hinttext: 'proudct description',
                onSaved: (data) {
                  description = data;
                },
              ),
              custm_text(
                hinttext: 'proudct category',
                onSaved: (data) {
                  category = data;
                },
              ),
              custm_text(
                hinttext: 'proudct location',
                onSaved: (data) {
                  location = data;
                },
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * 3,
              ),
              BlocBuilder<AddproudctCubit, AddproudctState>(
                builder: (context, state) {
                  return custom_button(
                    text: 'Update',
                    color: Colors.amberAccent,
                    onTap: () {
                      model.DocId;
                      formstate.currentState!.save();
                      proudct_model pmodel = proudct_model(
                          name: name == null ? model.name : name!,
                          price: price == null ? model.price : price!,
                          description: description == null
                              ? model.description
                              : description!,
                          category:
                              category == null ? model.category : category!,
                          location:
                              location == null ? model.location : location!);
                      BlocProvider.of<AddproudctCubit>(context)
                          .upadteData(model: pmodel, id: model.DocId);
                      BlocProvider.of<AddproudctCubit>(context).loadData();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

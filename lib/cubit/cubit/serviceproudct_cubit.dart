import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commapp/Data/models/proudct_model.dart';

import '../../const/constants.dart';

part 'serviceproudct_state.dart';

class AddproudctCubit extends Cubit<AddproudctState> {
  AddproudctCubit() : super(AddproudctInitial());
  CollectionReference Proudct =
      FirebaseFirestore.instance.collection(kProductCollection);
  addproudct({required proudct_model model}) {
    Proudct.add({
      kProductname: model.name,
      kProductprice: model.price,
      kProductdescription: model.description,
      kProductcatogray: model.category,
      kProductlocation: model.location,
    });
  }

  loadData() async {
    List<proudct_model> listproudct = [];

    var Snapshot = await Proudct.get();
    for (var doc in Snapshot.docs) {
      var data = doc.data();
      String id = doc.id;
      listproudct.add(proudct_model.fromJson(data, id));
    }
    emit(Addproudcsuccess(prodctlist: listproudct));
  }

  upadteData({required proudct_model model, id}) async {
    await Proudct.doc(id)
        .update({
          kProductname: model.name,
          kProductprice: model.price,
          kProductdescription: model.description,
          kProductcatogray: model.category,
          kProductlocation: model.location,
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  deletDoc(docomentid) {
    Proudct.doc(docomentid).delete();
  }
}

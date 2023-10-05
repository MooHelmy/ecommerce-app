import 'package:e_commapp/const/constants.dart';

class proudct_model {
  String name;
  String price;
  String description;
  String category;
  String location;
  String? DocId;

  proudct_model({
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.location,
    this.DocId,
  });
  factory proudct_model.fromJson(data, String id) {
    return proudct_model(
        name: data[kProductname],
        price: data[kProductprice],
        description: data[kProductdescription],
        category: data[kProductcatogray],
        location: data[kProductlocation],
        DocId: id);
  }
}

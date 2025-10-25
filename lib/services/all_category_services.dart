import 'package:store/helper/api.dart';

class AllCategortyServices {
  Future<List<dynamic>> getAllCategory() async {
    List<dynamic> data =
        await API().get(url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}

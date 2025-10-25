import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class GetAllProductServices {
  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> data =
        await API().get(url: "https://fakestoreapi.com/products", token: null);

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}

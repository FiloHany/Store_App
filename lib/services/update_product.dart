import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class UpdateProductServices{

  Future<ProductModel> updateProduct (
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}
  ) async{
    Map<String, dynamic> data = await API().put(
        url: 'https://fakestoreapi.com/products',
        body: {
          'title': title,
          'price': price,
          'description': description,
          'image': image,
          'category': category,
        }, token: null
    );
    return ProductModel.fromJson(data);
  }
}
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/update_product.dart';
import 'package:store/widgets/custom_text_field.dart';
import 'package:store/widgets/custome_button.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});

  static const String id = 'updateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String ? ProductName, ProductDescription , ProductImageUrl ;

  String ? ProductPrice ;
  bool isloading = false ;
  @override
  Widget build(BuildContext context) {
    //sending old data to text fields
    ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100),
                CustomTextField(hintText: 'Product Name',
                  onChanged: (data){
                    ProductName = data ;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(hintText: 'Product Price',
                  onChanged: (data){
                    ProductPrice = data ;
                  },
                  inputType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                CustomTextField(hintText: 'Product Description',
                  onChanged: (data){
                    ProductDescription = data ;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(hintText: 'Product Image URL',
                  onChanged: (data){
                    ProductImageUrl = data ;
                  },
                ),
                const SizedBox(height: 20),
                CustomeButton(
                  text: 'Update Product',
                  onPressed: () async{
                    setState(() {
                      isloading = true ;
                    });
                    // Implement update product functionality here
                    try {
                      await updateProduct(product);
                      print('Product Updated');
                    } on Exception catch (e) {
                      print(e.toString());
                    }
                    setState(() {
                      isloading = false ;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductServices().updateProduct(
      id: product.id,
      title: ProductName == null ? product.title : ProductName!,
      price: ProductPrice == null ? product.price.toString() : ProductPrice!,
      description: ProductDescription == null ? product.description : ProductDescription!,
      image: ProductImageUrl == null ? product.image : ProductImageUrl!,
      category: product.category,
    );
  }
}

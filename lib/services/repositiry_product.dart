import 'package:state_management/model/product.dart';
import 'package:state_management/services/provider_product.dart';

class RepositoryProduct {
  final ProviderProduct _providerProduct = ProviderProduct();
  Future<List<Product>> getAllProducts() => _providerProduct.getProduct();
}

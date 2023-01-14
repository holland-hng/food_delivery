import 'package:core_dependency/core_dependency.dart';
import 'package:profile_feature/core/realm/realm.dart';
import 'shipping_address_rest_client.dart';
import '/src/data/shipping_address/model/shipping_address_dto.dart';
import '/src/data/shipping_address/model/shipping_address_dao.dart';
import '/src/domain/repository/shipping_address_repository.dart';

@Singleton(as: ShippingAddressRepository)
class ShippingAddressRepositoryImpl extends ShippingAddressRepository {
  final ShippingAddressRestClient remoteDataSource;
  final ProfileFeatureRealm localDataSource;

  ShippingAddressRepositoryImpl(this.remoteDataSource, this.localDataSource);
  @override
  void cacheAddresses(List<ShippingAddressDao> addresses) {
    localDataSource.addAll(addresses);
  }

  @override
  Future<List<ShippingAddressDto>> fetchAddresses() async {
    final result = await remoteDataSource.fetchShippingAddress();

    return result;
  }

  @override
  ShippingAddressDao getAddressCached(String id) {
    final result = localDataSource.get<ShippingAddressDao>(primaryKey: id);
    return result!;
  }
}

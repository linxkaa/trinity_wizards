import 'package:injectable/injectable.dart';
import 'package:trinity_wizards/domain/home/entity/contact_entity.dart';
import 'package:trinity_wizards/domain/home/i_home_repository.dart';
import 'package:trinity_wizards/infrastructure/data_source/home_data_sources.dart';

@LazySingleton(as: IHomeRepository)
class HomeRepository implements IHomeRepository {
  final HomeDataSource _dataSource;

  HomeRepository(this._dataSource);

  @override
  Future<List<ContactEntity>> getContact() async {
    try {
      final response = await _dataSource.getContact();
      return response;
    } catch (e) {
      return [];
    }
  }
}

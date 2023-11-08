import 'package:trinity_wizards/domain/home/entity/contact_entity.dart';

abstract class IHomeRepository {
  Future<List<ContactEntity>> getContact();
}

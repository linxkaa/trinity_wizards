import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:trinity_wizards/domain/home/entity/contact_entity.dart';

@injectable
class HomeDataSource {
  HomeDataSource();

  Future<List<ContactEntity>> getContact() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    final rawList = data as List;
    final list = rawList.map((i) => ContactEntity.fromJson(i)).toList();
    return list;
  }
}

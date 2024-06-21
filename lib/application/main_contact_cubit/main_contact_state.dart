part of 'main_contact_cubit.dart';

@freezed
class MainContactState with _$MainContactState {
  const MainContactState._();
  const factory MainContactState({
    required List<ContactEntity> model,
    required List<ContactEntity> modelFiltered,
    required bool showSearch,
  }) = _MainContactState;

  factory MainContactState.initial() => const MainContactState(
        model: [],
        showSearch: false,
        modelFiltered: [],
      );

  List<ContactEntity> updateContact(ContactEntity entity) {
    final newModel = [...model];
    final newEntity = newModel.singleWhere((element) => element.id == entity.id);
    final index = newModel.indexOf(newEntity);
    newModel[index] = entity;
    return newModel;
  }

  List<ContactEntity> addNewContact(ContactEntity entity) {
    final newModel = [...model, entity.copyWith(id: Random().nextInt(1000).toString())];
    return newModel;
  }

  List<ContactEntity> filterContact(String query) {
    final filteredList = model
        .where((element) =>
            '${element.firstName.toLowerCase()} ${element.lastName.toLowerCase()}'.contains(query.toLowerCase()))
        .toList();
    return filteredList;
  }
}

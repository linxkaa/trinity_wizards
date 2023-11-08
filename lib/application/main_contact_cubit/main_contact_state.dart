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
    final newModel = [...model]
      ..removeWhere((element) => element.id == entity.id)
      ..add(entity);
    return newModel;
  }

  List<ContactEntity> addNewContact(ContactEntity entity) {
    final newModel = [...model, entity];
    return newModel;
  }

  List<ContactEntity> filterContact(String query) {
    final filteredList = model
        .where((element) =>
            element.firstName.toLowerCase().contains(query) || element.lastName.toLowerCase().contains(query))
        .toList();
    return filteredList;
  }
}

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:trinity_wizards/domain/home/entity/contact_entity.dart';
import 'package:trinity_wizards/domain/home/i_home_repository.dart';

part 'main_contact_cubit.freezed.dart';
part 'main_contact_state.dart';

@injectable
class MainContactCubit extends Cubit<MainContactState> {
  final IHomeRepository _repository;
  late TextEditingController searchController;
  MainContactCubit(this._repository) : super(MainContactState.initial()) {
    getAllContact();
    searchController = TextEditingController()
      ..addListener(() {
        searchContact(searchController.text);
      });
  }

  void toggleSearch() {
    emit(state.copyWith(showSearch: !state.showSearch));
  }

  void searchContact(String val) {
    emit(state.copyWith(modelFiltered: state.filterContact(val)));
  }

  void getAllContact() async {
    final newModel = await _repository.getContact();
    emit(state.copyWith(model: newModel));
  }

  void updateContact(ContactEntity entity) {
    emit(state.copyWith(model: state.updateContact(entity)));
  }

  void addNewContact(ContactEntity entity) {
    emit(state.copyWith(model: state.addNewContact(entity)));
  }
}

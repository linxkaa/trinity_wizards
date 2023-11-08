import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trinity_wizards/domain/home/entity/contact_entity.dart';

part 'edit_contact_cubit.freezed.dart';
part 'edit_contact_state.dart';

class EditContactCubit extends Cubit<EditContactState> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController dobController;

  EditContactCubit() : super(EditContactState.initial()) {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    dobController = TextEditingController();
  }

  void initial(ContactEntity? entity) {
    if (entity != null) {
      emit(state.unmodified.copyWith(model: entity));

      firstNameController = TextEditingController()
        ..addListener(() {
          inputFirstName(firstNameController.text);
        });
      firstNameController.value = TextEditingValue(text: entity.firstName);

      lastNameController = TextEditingController()
        ..addListener(() {
          inputLastName(lastNameController.text);
        });
      lastNameController.value = TextEditingValue(text: entity.lastName);

      emailController = TextEditingController()
        ..addListener(() {
          inputEmail(emailController.text);
        });
      emailController.value = TextEditingValue(text: entity.email ?? '');

      dobController = TextEditingController()
        ..addListener(() {
          inputDob(dobController.text);
        });
      dobController.value = TextEditingValue(text: entity.dob ?? '');
    } else {
      firstNameController = TextEditingController()
        ..addListener(() {
          inputFirstName(firstNameController.text);
        });
      lastNameController = TextEditingController()
        ..addListener(() {
          inputLastName(lastNameController.text);
        });
      emailController = TextEditingController()
        ..addListener(() {
          inputEmail(emailController.text);
        });
      dobController = TextEditingController()
        ..addListener(() {
          inputDob(dobController.text);
        });
    }
  }

  void inputFirstName(String val) {
    emit(state.unmodified.copyWith.model(firstName: val));
  }

  void inputLastName(String val) {
    emit(state.unmodified.copyWith.model(lastName: val));
  }

  void inputEmail(String val) {
    emit(state.unmodified.copyWith.model(email: val));
  }

  void inputDob(String val) {
    emit(state.unmodified.copyWith.model(dob: val));
  }

  void submit() {
    if (state.model.failureOption.isNone()) {
      emit(state.unmodified.copyWith(validated: true));
    } else {
      emit(state.unmodified.copyWith(showError: true));
    }
  }
}

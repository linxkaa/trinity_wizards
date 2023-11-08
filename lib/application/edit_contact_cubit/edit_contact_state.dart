part of 'edit_contact_cubit.dart';

@freezed
class EditContactState with _$EditContactState {
  const EditContactState._();
  const factory EditContactState({
    required ContactEntity model,
    required bool showError,
    required bool validated,
  }) = _EditContactState;

  factory EditContactState.initial() =>
      EditContactState(model: ContactEntity.empty(), showError: false, validated: false);
  EditContactState get unmodified => copyWith(
        validated: false,
      );

  String? get showFirstNameError => showError ? model.firstNameErrorMessages : null;
  String? get showLastNameError => showError ? model.lastNameErrorMessages : null;
}

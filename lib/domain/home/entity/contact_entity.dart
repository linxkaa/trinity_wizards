import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trinity_wizards/domain/core/form_failure.dart';
import 'package:trinity_wizards/domain/core/form_validator.dart';

part 'contact_entity.freezed.dart';
part 'contact_entity.g.dart';

@freezed
class ContactEntity with _$ContactEntity {
  const ContactEntity._();
  const factory ContactEntity({
    required String id,
    required String firstName,
    required String lastName,
    String? email,
    String? dob,
  }) = _ContactEntity;

  factory ContactEntity.empty() => const ContactEntity(
        firstName: '',
        id: '',
        lastName: '',
        email: '',
        dob: '',
      );

  Option<FormFailure> get failureOption {
    return FormValidator.emptyValidator(firstName).andThen(() => FormValidator.emptyValidator(lastName)).fold(
          (failure) => some(failure),
          (_) => none(),
        );
  }

  String? get firstNameErrorMessages {
    return FormValidator.emptyValidator(firstName).fold(
      (failure) => failure.maybeMap(
        orElse: () => null,
        empty: (_) => "First name must not be empty",
      ),
      (data) => null,
    );
  }

  String? get lastNameErrorMessages {
    return FormValidator.emptyValidator(lastName).fold(
      (failure) => failure.maybeMap(
        orElse: () => null,
        empty: (_) => "Last name must not be empty",
      ),
      (data) => null,
    );
  }

  factory ContactEntity.fromJson(Map<String, dynamic> json) => _$ContactEntityFromJson(json);
}

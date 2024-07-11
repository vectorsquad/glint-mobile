import 'dart:collection';
import 'util.dart' as util;

typedef ValidatorFunc = String? Function(String?);

final emailReg = RegExp(r'.+@.+\..+');

bool validEmail(String value) {
  return emailReg.hasMatch(value);
}

const passwordMinLength = 10;
const passwordInvalidLengthMessage = "Must be at least $passwordMinLength characters long";

var passwordRegexes = {
  "Missing one uppercase letter": RegExp(r'[A-Z]'),
  "Missing one lowercase letter": RegExp(r'[a-z]'),
  "Missing one number": RegExp(r'[0-9]')
}.entries;

String invalidPasswordMessage = "";

bool validPassword(String value) {

  // For each regex and associated error on failure...
  for(final requirement in passwordRegexes) {

    // Return early if no match was found for requirement
    if(!requirement.value.hasMatch(value)) {
      invalidPasswordMessage = requirement.key;
      return false;
    }

  }

  // Return early if password is not of correct length
  if(value.length < passwordMinLength) {
    invalidPasswordMessage = passwordInvalidLengthMessage;
    return false;
  }

  // Only here if password meets all requirements
  return true;
}

// Function invalidator wrapper object
class Validator {
  final bool Function(String) valid;
  final String Function() invalidMessage;
  Validator(this.invalidMessage, this.valid);
}

const defaultValidators = <Validator>[];

// Create a new validator composed from sub-invalidator functions.
ValidatorFunc createValidator(
    String emptyMessage,
    [List<Validator> invalidators = defaultValidators]
    ) {

  String? newValidator(String? s) {

    // Return early with missing input message if input is empty
    if(s == null || s.isEmpty) {
      return "Please enter $emptyMessage";
    }

    // For each sub-validator...
    for(final Validator(:valid, :invalidMessage) in invalidators) {

      // Return early if input is invalid
      if(!valid(s)) {
        return invalidMessage();
      }

    }

    return null;
  }

  return newValidator;

}

// First name validator
final firstNameValidator = createValidator("First Name");

// Last name validator
final lastNameValidator = createValidator("Last Name");

final usernameValidator = createValidator("Username");

// Email validator
final emailValidator = createValidator("Email", [
  Validator(util.str("Invalid Email"), validEmail)
]);

// Password validator
final passwordValidator = createValidator("Password", [
  Validator(() => invalidPasswordMessage, validPassword)
]);
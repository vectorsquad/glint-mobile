import 'util.dart' as util;

typedef ValidatorFunc = String? Function(String?);

final emailReg = RegExp(r'.+@.+\..+');

bool validEmail(String value) {
  return emailReg.hasMatch(value);
}

const passwordMinLength = 8;
const passwordInvalidLengthMessage = "Must be at least $passwordMinLength characters long";

const specialChars = "!@#\$%^&*()";

RegExp newSpecialCharsRegex() {

  var s = "(";

  s += specialChars
      .runes
      .map((r) => String.fromCharCode(r))
      .map((c) => RegExp.escape(c))
      .join("|");

  s += ")";

  return RegExp(s);

}

var passwordRegexes = {
  "one special character: $specialChars": newSpecialCharsRegex(),
  "one number": RegExp(r'[0-9]')
}.entries;

String invalidPasswordMessage = "";

bool validPassword(String value) {

  // For each regex and associated error on failure...
  for(final requirement in passwordRegexes) {

    // Return early if no match was found for requirement
    if(!requirement.value.hasMatch(value)) {
      invalidPasswordMessage = "Missing ${requirement.key}";
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

// Validator and invalid message wrapper
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

final codeValidator = createValidator("Verification Code");

final firstNameValidator = createValidator("First Name");

final lastNameValidator = createValidator("Last Name");

final usernameValidator = createValidator("Username");

final emailValidator = createValidator("Email", [
  Validator(util.str("Invalid Email"), validEmail),
]);

final passwordValidator = createValidator("Password", [
  Validator(() => invalidPasswordMessage, validPassword)
]);

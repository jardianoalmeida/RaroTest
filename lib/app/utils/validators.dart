import 'package:password_strength/password_strength.dart';
import 'package:string_validator/string_validator.dart';
import '../i18n/validators_i18n.dart';

abstract class Validators {

  static String? string({required String value, required String message, int minCharacters = 1}) {
    return value != null && value.isNotEmpty && value.length >= minCharacters
        ? null
        : message;
  }


  static String? fullName(String value) {
    final list = value.split(" ");

    if (value.isEmpty) {
      return "O nome não pode ser vazio".i18n;
    } else if (list.length == 1) {
      return "Digite o nome completo".i18n;
    } else {
      return null;
    }
  }

  static String? phone(String value) {
    if (value.isEmpty) {
      return "O número do celular não pode ser vazio".i18n;
    }

    final split = value
        .replaceAll(" ", "")
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll("-", "");
    if (split.length == 11) {
      return null;
    } else {
      return "Número inválido".i18n;
    }
  }

  static String? email(String? email) {
    if (email!.isEmpty) {
      return "O e-mail não pode ser vazio".i18n;
    } else if (isEmail(email)) {
      return null;
    } else {
      return "Digite um e-mail válido".i18n;
    }
  }

  static String? password(
      String password, {
        bool validateLenght = true,
        bool validateStrongness = true,
      }) {
    if (password.isEmpty) {
      return "A senha não pode ser vazia".i18n;
    } else if (validateLenght && password.length < 8) {
      return "Digite uma senha maior".i18n;
    }

    if (!validateStrongness) {
      return null;
    }

    final strength = estimatePasswordStrength(password);
    if (strength < 0.3) {
      return "Senha fraca, tente uma mais forte".i18n;
    } else {
      return null;
    }
  }

  static String? creditCardNumber(String value) {
    if (value.isEmpty) {
      return "O número do cartão não pode ser vazio".i18n;
    }
    if (isCreditCard(value)) {
      return null;
    } else {
      return "Digite um cartão válido".i18n;
    }
  }

  static String? creditCardCCV(String value) {
    if (value.isEmpty) {
      return "Não pode ser vazio".i18n;
    }
    if (value.length == 3) {
      return null;
    } else {
      return "Digite um CCV válido".i18n;
    }
  }

  static String? creditCardDate(String value) {
    if (value.isEmpty) {
      return "Não pode ser vazio".i18n;
    }

    final split = value.split("/");
    final month = int.parse(split[0]);
    final year = int.parse("20${split[1]}");
    final date = DateTime.now();
    if (year >= date.year) {
      if (month <= 12 && month >= date.month) {
        return null;
      } else {
        return "Data inválida".i18n;
      }
    } else {
      return "Data inválida".i18n;
    }
  }

  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9\+\.\_\%\-\+]{1,256}"
    r"\@"
    r"[a-zA-Z0-9][a-zA-Z0-9\-]{0,64}"
    r"(\."
    r"[a-zA-Z0-9][a-zA-Z0-9\-]{1,25}"
    r")+$"
        .i18n,
  );

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidUsername(String username) {
    return username.length >= 4;
  }

  static isValidPasswordLength(String password) {
    return password.length >= 4;
  }

  static String? hour(String hour) {
    var error = "Hora inválida".i18n;
    final parts = hour.split(":");
    if (parts.length == 2) {
      final hour = int.tryParse(parts[0]);
      final minutes = int.tryParse(parts[1]);
      if (hour != null && minutes != null) {
        final hourValidation = hour < 24 && hour >= 0;
        final minutesValidation = minutes < 60 && minutes >= 0;
        if (hourValidation && minutesValidation) {
          error = '';
        }
      }
    }
    return error;
  }

  static String? number(String? numberString) {
    var error = "Digite um número".i18n;
    final number = int.tryParse(numberString!);
    if ((number ?? 0) > 0) {
      error = '';
    }
    return error;
  }

  static String? date(
      String date, {
        bool optional = false,
        bool canBeAfterNow = false,
      }) {
    if (optional && (date == null || date.isEmpty)) return null;
    try {
      final dateSplited = date.split("/");
      final year = int.parse(dateSplited[2]);
      final month = int.parse(dateSplited[1]);
      final day = int.parse(dateSplited[0]);
      final now = DateTime.now();
      if (year > 2000 && month > 0 && month <= 12 && day > 0 && day <= 31) {
        if (canBeAfterNow) {
          return null;
        } else if (now.compareTo(DateTime(year, month, day)) >= 0) {
          return null;
        }
      }
    } catch (e) {}
    return "Digite uma data válida".i18n;
  }
}

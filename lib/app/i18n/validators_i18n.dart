import 'package:i18n_extension/i18n_extension.dart';

// For more info, see: https://pub.dartlang.org/packages/i18n_extension

extension ValidatorsLocalization on String {
  static var t = Translations("pt_br") +
      {
        "pt_br": "O nome não pode ser vazio",
        "en_us": "The name field can't be empty",
      } +
      {
        "pt_br": "Digite o nome completo",
        "en_us": "Type the complete name",
      } +
      {
        "pt_br": "O número do celular não pode ser vazio",
        "en_us": "The cellphone number field can't be empty",
      } +
      {
        "pt_br": "Número inválido",
        "en_us": "Invalid cellphone number",
      } +
      {
        "pt_br": "O email não pode ser vazio",
        "en_us": "The email field can't be empty",
      } +
      {
        "pt_br": "Digite um e-mail válido",
        "en_us": "Type a valid e-mail",
      } +
      {
        "pt_br": "A senha não pode ser vazia",
        "en_us": "The password field can't be empty",
      } +
      {
        "pt_br": "Senha fraca, tente uma mais forte",
        "en_us": "Weak password, try a strong ones",
      } +
      {
        "pt_br": "O número do cartão não pode ser vazio",
        "en_us": "Digite um cartão válido",
      } +
      {
        "pt_br": "Não pode ser vazio",
        "en_us": "Can't be empty",
      } +
      {
        "pt_br": "Digite um CCV válido",
        "en_us": "Type a valid CCV",
      } +
      {
        "pt_br": "Data inválida",
        "en_us": "Invalid date",
      };

  String get i18n => localize(this, t);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(int value) => localizePlural(value, this, t);

  String version(Object modifier) => localizeVersion(modifier, this, t);

  Map<String?, String> allVersions() => localizeAllVersions(this, t);
}

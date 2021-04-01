class Validator {
  static String notEmpty(value) {
    if (value.isEmpty) {
      return 'Enter Valid value';
    }
    return '';
  }

  static String morethan8digites(String value) {
    if (value.length < 8) {
      return 'Enter Valid value';
    }
    return '';
  }

  static String matchPassword(String password, String value) {
    if (value != password) {
      return "Password is not match";
    }
    return null;
  }

  static String saudiNumber(value) {
    RegExp regExp = new RegExp(
      r'^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$',
      caseSensitive: false,
      multiLine: false,
    );

    if (!regExp.hasMatch(value)) {
      return 'Enter vaild phone nubmer';
    }
    return '';
  }
}

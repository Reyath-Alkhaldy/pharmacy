class TValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required .";
    }

    final emailReqExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2-4}$');

    if (!emailReqExp.hasMatch(value)) {
      return "Envalid email address .";
    }

    return null;
  }

  static String? validatePassword(String? value) {

    return null;
  }

  static String? validatePhoneNumber(String? value) {

    return null;
  }
}

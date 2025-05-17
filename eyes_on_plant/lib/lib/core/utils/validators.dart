class Validators {
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }
  static bool isValidPassword(String password) {
    final RegExp passwordRegex = RegExp(
        r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?/~]).{8,}$'
    );
    return passwordRegex.hasMatch(password);
  }
}

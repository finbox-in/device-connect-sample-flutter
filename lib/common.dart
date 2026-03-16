// ### COPY THIS FILE TO
// ### ROOT/lib/common.dart


/// Helper class contains common functions
class CommonUitl {
  /// Generate the username and return it
  static String getUsername() {
    // Get the current date time
    final DateTime now = DateTime.now();
    // Create a user and return it
    return "demo_lender_${now.day}${now.month}${now.hour}${now.minute}";
  }
}

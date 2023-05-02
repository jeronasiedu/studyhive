/// Validate user input and data
class Validator {
  /// Validates Full Name and needs to be more than 4 characters
  static String? name(String? value) {
    const pattern = r'(^[a-zA-Z ]*$)';
    final regExp = RegExp(pattern);
    if (regExp.hasMatch(value!) && value.trim().length > 4) {
      return null;
    } else if (value.trim().length < 5) {
      return 'Full name must be more than 4 characters';
    }
    return null;
  }

  /// Pattern checks for valid phone Numbers
  // static String? phoneNumber(String? value) {
  //   const pattern = r'(^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$)';
  //   final regExp = RegExp(pattern);
  //   if (value!.isEmpty) {
  //     return '😉 Come on, don\'t be shy, enter your number';
  //   } else if (!regExp.hasMatch(value)) {
  //     return "Hmm 🤔, that doesn't look like a valid phone number";
  //   } else if (value.length > 16 || value.length < 9) {
  //     return "Hmm 🤔, that doesn't look like a valid phone number";
  //   } else if (value.startsWith('0') && value.length < 10) {
  //     return "👏 Come on, ${10 - value.length} digits more";
  //   } else if (value.startsWith('0') && value.length > 10) {
  //     return "📢 Valid phone numbers are 10 digits right ?";
  //   } else if (value.startsWith("") && value.length < 12) {
  //     return "Not sure if this is a valid phone number";
  //   }
  //   return null;
  // }
  static String? phoneNumber(String? value) {
    if (value!.isEmpty) {
      return '😉 Come on, don\'t be shy, enter your number';
    } else if (value.length < 10) {
      return '👏 Come on, ${10 - value.length} digits more';
    }

    /// When [value] is greater than 10
    else if (value.length > 10) {
      return '📢 Valid phone numbers are 10 digits right ?';
    }
    return null;
  }

  /// pattern for a valid code must start with either grp_ or comm_ and the length is 10 plus the prefix

  static String? validCode(String? value) {
    if (value!.isEmpty) {
      return "Come on, enter the code";
    } else if (!value.startsWith("grp_") && !value.startsWith("comm_")) {
      return "Invalid community or group code";
    } else if (value.startsWith('grp_') && value.length != 14) {
      return "Invalid group code";
    } else if (value.startsWith('comm_') && value.length != 15) {
      return "Invalid Community code";
    }

    return null;
  }
}

extension StringInitialsExtension on String {
  String get initials {
    List<String> names = split(" ");
    String initials = "";

    int numWords = names.length > 2 ? 2 : names.length; // use at most two names

    for (int i = 0; i < numWords; i++) {
      String initial = names[i][0].toUpperCase();
      initials += initial;
    }

    return initials;
  }
}

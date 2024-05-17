
//returns Song'' if 1;
//returns Song's' if not 1
String getTextPrefixForLength(int length) {
  if (length % 10 == 1) {
    return '';
  }
  else {
    return 's';
  }
}

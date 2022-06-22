class CommonUtil {
  static bool isChinaPhoneLegal(String str) {
    return new RegExp(
        '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$')
        .hasMatch(str);
  }

  static String noBlank(String str) {
    return str.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
  }

  static String splitPhoneNumber1(String src) {
    String s = CommonUtil.noBlank(src);
    if (CommonUtil
        .noBlank(s)
        .length > 7) {
      Pattern regex = RegExp(r'(1\w{2})(\w{4})(\w{1,4})');
      return s.replaceAllMapped(
          regex, (match) => '${match[1]} ${match[2]} ${match[3]}');
    }
    if (CommonUtil
        .noBlank(s)
        .length > 3) {
      Pattern regex = RegExp(r'(1\w{2})(\w{1,4})');
      return s.replaceAllMapped(
          regex, (match) => '${match[1]} ${match[2]}');
    }
    return s;
  }
}
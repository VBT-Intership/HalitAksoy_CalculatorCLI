class Tokenizer {
  String text;

  List<String> tokens = [];

  Tokenizer(this.text);

  List<String> parseTokens() {
    tokens.clear();

    var buffer = StringBuffer();
    for (var rune in text.runes) {
      var char = String.fromCharCode(rune);
      if (isSpace(char)) {
        addNumeric(buffer);
      } else if (isNumericOrDot(char)) {
        buffer.write(char);
      } else {
        addNumeric(buffer);
        tokens.add(char);
      }
    }
    addNumeric(buffer);
    return tokens;
  }

  void addNumeric(StringBuffer buffer) {
    if (buffer.toString().isNotEmpty) {
      tokens.add(buffer.toString());
      buffer.clear();
    }
  }

  bool isSpace(String text) => text == ' ' || text == '\t';

  bool isNumericOrDot(String text) => isNumeric(text) || isDot(text);

  bool isNumeric(String text) => double.tryParse(text) != null;

  bool isDot(String text) => text == '.';
}

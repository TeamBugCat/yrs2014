import 'dart:html';

var target;

void main() {
  target = querySelector("#sample_text_id");
  
  target
    ..text = "Click me!"
    ..onClick.listen(reverseText);
}

void reverseText(MouseEvent event) {
  String text = target.text;
  StringBuffer buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  target.text = buffer.toString();
}

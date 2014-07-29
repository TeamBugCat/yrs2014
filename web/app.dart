//import "package:polymer/polymer.dart";
import "dart:html";

void main() {
  window.onClick.listen((MouseEvent e) {
    print("Clickety click at ${e.client.x},${e.client.y}");
  });
  
  window.onKeyPress.listen((KeyboardEvent e){
    print("Key ${e.charCode} (charcode) pressed.");
  });
}

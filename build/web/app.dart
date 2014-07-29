//import "package:polymer/polymer.dart";
import "dart:html";

const List<int> KCODE = const [38, 38, 40, 40, 37, 39, 37, 39, 66, 65];
List<int> currentKcodeList = [];

void main() {
  window.onClick.listen((MouseEvent e) {
    print("Clickety click at ${e.client.x},${e.client.y}");
  });
  
  window.onKeyDown.listen((KeyboardEvent e) {
    print("Key ${e.keyCode} (charcode) pressed.");
    
    if (KCODE[currentKcodeList.length] == e.keyCode) {
      currentKcodeList.add(e.keyCode);
    }
    
    if (listsEqual(KCODE, currentKcodeList)) {
      currentKcodeList = [];
      doKonami();
    }
  });
}

void doKonami() {
  print("Konami code");
  document.body.innerHtml = '''
    <img src="http://fc09.deviantart.net/fs70/f/2013/152/c/0/c032cff5018b599625e96c5eaa424c66-d5xk0s3.png">
  ''';
}

bool listsEqual(List a, List b) {
  if (a.length != b.length) return false;
  
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  
  return true;
}

library yrs2014;

//import "package:polymer/polymer.dart";
import "dart:html";
import "dart:async";
import "dart:math";
import "dart:convert";
import 'package:polymer/polymer.dart';

import "elements.dart";

part "api_interface.dart";

Timer t;

const List<int> KCODE = const [38, 38, 40, 40, 37, 39, 37, 39, 66, 65];
List<int> currentKcodeList = [];

void main() {
  initPolymer();
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

  sources..then((map) {
    print("Available sources");
    Element parent = querySelector("#news_select");
    for (var key in (map as Map).keys) {
      var value = map[key];

      print("${value["namePretty"]}: ${value["index"]}");
      SourceSelectionElement elem = (document.createElement("source-selection") as SourceSelectionElement);
      elem.className = "select";
      elem.news = key;
      parent.append(elem);
    }
  })
  ..catchError((error) {
    print("Error: $error");
  });
}

void doKonami() {
  print("Konami code");
  if (t != null) {
    t.cancel();
    t = null;
    return;
  }

  t = new Timer.periodic(new Duration(seconds: 1), (_) {
    HtmlElement menu = querySelector(".menubar");

    final Random r = new Random();

    menu.style.backgroundColor = "rgb(${r.nextInt(255)}, ${r.nextInt(255)}, ${r.nextInt(255)})";
  });
}

bool listsEqual(List a, List b) {
  if (a.length != b.length) return false;

  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }

  return true;
}

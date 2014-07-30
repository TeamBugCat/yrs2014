import "package:polymer/polymer.dart";
import "./app.dart";

@CustomTag('source-selection')
class SourceSelectionElement extends PolymerElement {
  // @published means 'this is an attribute', and it is observable.
  @published String news = "bbcNews";
  @published bool checked = false;
  
  @observable String sourceName = "Loading...";

  SourceSelectionElement.created() : super.created() {
    sources.then((value) {
      sourceName = value[news];
    });
  }
}
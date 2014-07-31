import "package:polymer/polymer.dart";
import "./app.dart";

const String LOADING = "Loading...";

@CustomTag('source-selection')
class SourceSelectionElement extends PolymerElement {
  // @published means 'this is an attribute', and it is observable.
  @published String news = "bbcNews";
  @published bool checked = false;

  @observable String get sourceName {
    if (_objCache != null) {
      return _objCache["namePretty"];
    } else {
      return "Loading...";
    }
  }

  @observable String get sourceUrl {
    if (_objCache != null) {
      return _objCache["index"];
    } else {
      return "Loading...";
    }
  }

  var _objCache = null;

  SourceSelectionElement.created() : super.created() {
    sources.then((value) {
      _objCache = value[news];
      this.notifyPropertyChange(new Symbol("sourceName"), LOADING, sourceName);
      this.notifyPropertyChange(new Symbol("sourceUrl"), LOADING, sourceUrl);
    });
  }
}
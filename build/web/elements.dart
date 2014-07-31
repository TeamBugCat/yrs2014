import "package:polymer/polymer.dart";
import "./app.dart";

const String LOADING = "Loading...";

@CustomTag('source-selection')
class SourceSelectionElement extends PolymerElement with ChangeNotifier  {
  // @published means 'this is an attribute', and it is observable.
  @reflectable @published String get news => __$news; String __$news = "bbcNews"; @reflectable set news(String value) { __$news = notifyPropertyChange(#news, __$news, value); }
  @reflectable @published bool get checked => __$checked; bool __$checked = false; @reflectable set checked(bool value) { __$checked = notifyPropertyChange(#checked, __$checked, value); }

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
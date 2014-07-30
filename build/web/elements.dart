import "package:polymer/polymer.dart";
import "./app.dart";

@CustomTag('source-selection')
class SourceSelectionElement extends PolymerElement with ChangeNotifier  {
  // @published means 'this is an attribute', and it is observable.
  @reflectable @published String get news => __$news; String __$news = "bbcNews"; @reflectable set news(String value) { __$news = notifyPropertyChange(#news, __$news, value); }
  @reflectable @published bool get checked => __$checked; bool __$checked = false; @reflectable set checked(bool value) { __$checked = notifyPropertyChange(#checked, __$checked, value); }
  
  @reflectable @observable String get sourceName => __$sourceName; String __$sourceName = "Loading..."; @reflectable set sourceName(String value) { __$sourceName = notifyPropertyChange(#sourceName, __$sourceName, value); }

  SourceSelectionElement.created() : super.created() {
    sources.then((value) {
      sourceName = value[news];
    });
  }
}
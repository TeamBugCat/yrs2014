part of yrs2014;

@CustomTag('source-selection')
class SourceSelectionElement extends PolymerElement {
  // @published means 'this is an attribute', and it is observable.
  @published bool get checked {

  }
  @published      set checked(bool val) {

  }

  @published String imgsrc = "http://johancutych.com/img/full/swag.png";

  SourceSelectionElement.created() : super.created();
}
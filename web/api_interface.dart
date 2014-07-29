part of yrs2014;

Future get sources {
  Completer comp = new Completer();
  
  HttpRequest.getString("/api/sources")..then((value) {
    var decode = new JsonDecoder();
    var obj = decode.convert(value);
    comp.complete(obj);
  })
  ..catchError((err) {
    comp.completeError(err);
  });
  
  return comp.future;
}
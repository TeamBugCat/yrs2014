import 'package:polymer/builder.dart';

void main(List<String> args) {
  lint(entryPoints: ['web/index.html'], options: parseOptions(args));
  
  build(entryPoints: ['web/polytest.html'],
          options: parseOptions(args));
}
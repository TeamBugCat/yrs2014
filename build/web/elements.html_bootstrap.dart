library app_bootstrap;

import 'package:polymer/polymer.dart';

import 'package:core_elements/core_meta.dart' as i0;
import 'package:core_elements/core_iconset.dart' as i1;
import 'package:core_elements/core_icon.dart' as i2;
import 'package:core_elements/core_item.dart' as i3;
import 'package:paper_elements/paper_ripple.dart' as i4;
import 'package:paper_elements/paper_radio_button.dart' as i5;
import 'package:paper_elements/paper_checkbox.dart' as i6;
import 'elements.dart' as i7;
import 'package:smoke/smoke.dart' show Declaration, PROPERTY, METHOD;
import 'package:smoke/static.dart' show useGeneratedCode, StaticConfiguration;
import 'elements.dart' as smoke_0;
import 'package:polymer/polymer.dart' as smoke_1;
import 'package:observe/src/metadata.dart' as smoke_2;
abstract class _M0 {} // PolymerElement & ChangeNotifier

void main() {
  useGeneratedCode(new StaticConfiguration(
      checkedMode: false,
      getters: {
        #checkboxAnimationEnd: (o) => o.checkboxAnimationEnd,
        #checked: (o) => o.checked,
        #icon: (o) => o.icon,
        #label: (o) => o.label,
        #news: (o) => o.news,
        #sourceName: (o) => o.sourceName,
        #src: (o) => o.src,
        #tokenList: (o) => o.tokenList,
      },
      setters: {
        #checked: (o, v) { o.checked = v; },
        #icon: (o, v) { o.icon = v; },
        #news: (o, v) { o.news = v; },
        #sourceName: (o, v) { o.sourceName = v; },
        #src: (o, v) { o.src = v; },
      },
      parents: {
        smoke_0.SourceSelectionElement: _M0,
        _M0: smoke_1.PolymerElement,
      },
      declarations: {
        smoke_0.SourceSelectionElement: {
          #checked: const Declaration(#checked, bool, kind: PROPERTY, annotations: const [smoke_2.reflectable, smoke_1.published]),
          #news: const Declaration(#news, String, kind: PROPERTY, annotations: const [smoke_2.reflectable, smoke_1.published]),
          #sourceName: const Declaration(#sourceName, String, kind: PROPERTY, annotations: const [smoke_2.reflectable, smoke_2.observable]),
        },
      },
      names: {
        #checkboxAnimationEnd: r'checkboxAnimationEnd',
        #checked: r'checked',
        #icon: r'icon',
        #label: r'label',
        #news: r'news',
        #sourceName: r'sourceName',
        #src: r'src',
        #tokenList: r'tokenList',
      }));
  configureForDeployment([
      i0.upgradeCoreMeta,
      i1.upgradeCoreIconset,
      i2.upgradeCoreIcon,
      i3.upgradeCoreItem,
      i4.upgradePaperRipple,
      i5.upgradePaperRadioButton,
      i6.upgradePaperCheckbox,
      () => Polymer.register('source-selection', i7.SourceSelectionElement),
    ]);
  i7.main();
}

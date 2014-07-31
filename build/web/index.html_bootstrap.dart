library app_bootstrap;

import 'package:polymer/polymer.dart';

import 'package:core_elements/core_meta.dart' as i0;
import 'package:core_elements/core_iconset.dart' as i1;
import 'package:core_elements/core_icon.dart' as i2;
import 'package:core_elements/core_icons.dart' as i3;
import 'package:core_elements/core_icon_button.dart' as i4;
import 'package:core_elements/core_selection.dart' as i5;
import 'package:core_elements/core_selector.dart' as i6;
import 'package:core_elements/core_menu.dart' as i7;
import 'package:core_elements/core_transition.dart' as i8;
import 'package:core_elements/core_key_helper.dart' as i9;
import 'package:core_elements/core_overlay_layer.dart' as i10;
import 'package:core_elements/core_overlay.dart' as i11;
import 'package:core_elements/core_menu_button.dart' as i12;
import 'package:core_elements/core_toolbar.dart' as i13;
import 'package:paper_elements/paper_ripple.dart' as i14;
import 'package:paper_elements/paper_item.dart' as i15;
import 'package:paper_elements/paper_radio_button.dart' as i16;
import 'package:paper_elements/paper_radio_group.dart' as i17;
import 'package:core_elements/core_item.dart' as i18;
import 'package:paper_elements/paper_checkbox.dart' as i19;
import 'package:core_elements/core_tooltip.dart' as i20;
import 'elements.dart' as i21;
import 'app.dart' as i22;
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
        #$: (o) => o.$,
        #checkboxAnimationEnd: (o) => o.checkboxAnimationEnd,
        #checked: (o) => o.checked,
        #closeAction: (o) => o.closeAction,
        #halign: (o) => o.halign,
        #icon: (o) => o.icon,
        #iconSrc: (o) => o.iconSrc,
        #inlineMenu: (o) => o.inlineMenu,
        #label: (o) => o.label,
        #multi: (o) => o.multi,
        #news: (o) => o.news,
        #noarrow: (o) => o.noarrow,
        #opened: (o) => o.opened,
        #overlay: (o) => o.overlay,
        #position: (o) => o.position,
        #selected: (o) => o.selected,
        #selectedClass: (o) => o.selectedClass,
        #selectedItem: (o) => o.selectedItem,
        #selectionSelect: (o) => o.selectionSelect,
        #show: (o) => o.show,
        #sourceName: (o) => o.sourceName,
        #sourceUrl: (o) => o.sourceUrl,
        #src: (o) => o.src,
        #toggle: (o) => o.toggle,
        #tokenList: (o) => o.tokenList,
        #valign: (o) => o.valign,
        #valueattr: (o) => o.valueattr,
      },
      setters: {
        #checked: (o, v) { o.checked = v; },
        #icon: (o, v) { o.icon = v; },
        #iconSrc: (o, v) { o.iconSrc = v; },
        #multi: (o, v) { o.multi = v; },
        #news: (o, v) { o.news = v; },
        #opened: (o, v) { o.opened = v; },
        #overlay: (o, v) { o.overlay = v; },
        #selected: (o, v) { o.selected = v; },
        #selectedClass: (o, v) { o.selectedClass = v; },
        #selectedItem: (o, v) { o.selectedItem = v; },
        #sourceUrl: (o, v) { o.sourceUrl = v; },
        #src: (o, v) { o.src = v; },
        #valueattr: (o, v) { o.valueattr = v; },
      },
      parents: {
        smoke_0.SourceSelectionElement: _M0,
        _M0: smoke_1.PolymerElement,
      },
      declarations: {
        smoke_0.SourceSelectionElement: {
          #checked: const Declaration(#checked, bool, kind: PROPERTY, annotations: const [smoke_2.reflectable, smoke_1.published]),
          #news: const Declaration(#news, String, kind: PROPERTY, annotations: const [smoke_2.reflectable, smoke_1.published]),
          #sourceName: const Declaration(#sourceName, String, kind: PROPERTY, isFinal: true, annotations: const [smoke_2.observable]),
          #sourceUrl: const Declaration(#sourceUrl, String, kind: PROPERTY, isFinal: true, annotations: const [smoke_2.observable]),
        },
      },
      names: {
        #$: r'$',
        #checkboxAnimationEnd: r'checkboxAnimationEnd',
        #checked: r'checked',
        #closeAction: r'closeAction',
        #halign: r'halign',
        #icon: r'icon',
        #iconSrc: r'iconSrc',
        #inlineMenu: r'inlineMenu',
        #label: r'label',
        #multi: r'multi',
        #news: r'news',
        #noarrow: r'noarrow',
        #opened: r'opened',
        #overlay: r'overlay',
        #position: r'position',
        #selected: r'selected',
        #selectedClass: r'selectedClass',
        #selectedItem: r'selectedItem',
        #selectionSelect: r'selectionSelect',
        #show: r'show',
        #sourceName: r'sourceName',
        #sourceUrl: r'sourceUrl',
        #src: r'src',
        #toggle: r'toggle',
        #tokenList: r'tokenList',
        #valign: r'valign',
        #valueattr: r'valueattr',
      }));
  configureForDeployment([
      i0.upgradeCoreMeta,
      i1.upgradeCoreIconset,
      i2.upgradeCoreIcon,
      i4.upgradeCoreIconButton,
      i5.upgradeCoreSelection,
      i6.upgradeCoreSelector,
      i7.upgradeCoreMenu,
      i8.upgradeCoreTransition,
      i9.upgradeCoreKeyHelper,
      i10.upgradeCoreOverlayLayer,
      i11.upgradeCoreOverlay,
      i12.upgradeCoreMenuButton,
      i13.upgradeCoreToolbar,
      i14.upgradePaperRipple,
      i15.upgradePaperItem,
      i16.upgradePaperRadioButton,
      i17.upgradePaperRadioGroup,
      i18.upgradeCoreItem,
      i19.upgradePaperCheckbox,
      i20.upgradeCoreTooltip,
      () => Polymer.register('source-selection', i21.SourceSelectionElement),
    ]);
  i22.main();
}

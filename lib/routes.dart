import 'package:flutter/material.dart';
import 'package:flutter_app2/ButtonPage.dart';
import 'package:flutter_app2/CupertinoPage.dart';
import 'package:flutter_app2/Image.dart';
import 'package:flutter_app2/StatePageA.dart';
import 'package:flutter_app2/StatePageB.dart';
import 'package:flutter_app2/SwitchAndCheckBoxTestRoute.dart';
import 'package:flutter_app2/TextPage.dart';
import 'package:flutter_app2/edit_page.dart';
import 'package:flutter_app2/layout_page.dart';
import 'package:flutter_app2/progress_page.dart';
import 'package:flutter_app2/scaffold_page.dart';
import 'package:flutter_app2/scroll_page.dart.dart';
import 'package:flutter_app2/stack_layout_page.dart';
import 'package:flutter_app2/state/shop_item.dart';
import 'package:flutter_app2/transform_page.dart';

import 'FormTestRoute.dart';
import 'SnackBarPage.dart';
import 'align_layout_page.dart';
import 'anim/anim_page.dart';
import 'anim/anim_switcher.dart';
import 'anim/more_anim.dart';
import 'anim/over_anim.dart';
import 'aysn/aysn_ui_page.dart';
import 'box_page.dart';
import 'clip_page.dart.dart';
import 'color/color_page.dart';
import 'custom_scrollView_page.dart';
import 'dialog/dialog_page.dart';
import 'event/event_bus_test.dart';
import 'event/event_test.dart';
import 'event/notification_page.dart';
import 'flex_layout_page.dart';
import 'flow_layout_page.dart';
import 'function_page.dart';
import 'hero/heroa.dart';
import 'home.dart';
import 'inherited_page.dart';

const String homeRoute = '/';

const String ROUTE_PAGE = "route_page";
const String PARAMS_PAGE = "params_page";
const String IMAGE_PAGE = "image_page";
const String CUPERTINO_PAGE = "cupertino_page";
const String STATEA_PAGE = "statea_page";
const String StatePageB_PAGE = "statepageb_page";
const String TEXT_PAGE = "text_page";
const String BUTTON_PAGE = "button_page";
const String SWITCHANDCHECKBOXTESTROUTE = "switchandcheckboxtestroute";
const String EDITPAGE = "editpage";
const String FORMTESTROUTE = "formtestroute";
const String PROGRESSPAGE = "ProgressPage";
const String LAYOUTPAGE = "LayoutPage";
const String FLEXLAYOUTPAGE = "FlexLayoutPage";
const String FLOWLAYOUTPAGE = "FlowLayoutPage";
const String STACKLAYOUTPAGE = "StackLayoutPage";
const String ALIGNLAYOUTPAGE = "AlignLayoutPage";
const String BOXPAGE = "BoxPage";
const String TRANSFORMPAGE = "TransformPage";
const String SCAFFOLDPAGE = "ScaffoldPage";
const String CLIPPAGE = "ClipPage";
const String SCROLLPAGE = "ScrollPage";
const String SNACKBARPAGE = "SnackBarPage";
const String CUSTOMSCROLLVIEWPAGE = "CustomScrollViewPage";
const String FUNCTIONPAGE = "FunctionPage";
const String INHERITEDWIDGETTESTROUTE = "InheritedWidgetTestRoute";
const String PROVIDERPAGE = "ProviderPage";
const String COLORPAGE = "ColorPage";
const String AYSNUIPAGE = "AysnUiPage";
const String DIALOGPAGE = "DialogPage";
const String EVENTPAGE = "EventPage";
const String IEVENTBUS = "IEventBus";
const String NOTIFICATIONPAGE = "NotificationPage";
const String ANIMPAGE = "AnimPage";
const String HEROAPAGE = "HeroAPage";
const String STAGGERROUTE = "StaggerRoute";
const String ANIMSWITCHER = "AnimSwitcher";
const String OVERANIMPAGE = "OverAnimPage";

///集合
Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  homeRoute: (BuildContext context) => new MyHomePage(),
  IMAGE_PAGE: (BuildContext context) => ImagePage(),
  CUPERTINO_PAGE: (context) => CupertinoPage(),
  STATEA_PAGE: (context) => StatePageA(),
  StatePageB_PAGE: (context) => StatePageB(),
  TEXT_PAGE: (context) => TextPage(),
  BUTTON_PAGE: (context) => ButtonPage(),
  SWITCHANDCHECKBOXTESTROUTE: (context) => SwitchAndCheckBoxTestRoute(),
  EDITPAGE: (context) => EditPage(),
  FORMTESTROUTE: (context) => FormTestRoute(),
  PROGRESSPAGE: (context) => ProgressPage(),
  LAYOUTPAGE: (context) => LayoutPage(),
  FLEXLAYOUTPAGE: (context) => FlexLayoutPage(),
  FLOWLAYOUTPAGE: (context) => FlowLayoutPage(),
  STACKLAYOUTPAGE: (context) => StackLayoutPage(),
  ALIGNLAYOUTPAGE: (context) => AlignLayoutPage(),
  BOXPAGE: (context) => BoxPage(),
  TRANSFORMPAGE: (context) => TransformPage(),
  SCAFFOLDPAGE: (context) => ScaffoldPage(),
  CLIPPAGE: (context) => ClipPage(),
  SCROLLPAGE: (context) => ScrollPage(),
  SNACKBARPAGE: (context) => SnackBarPage(),
  CUSTOMSCROLLVIEWPAGE: (context) => CustomScrollViewPage(),
  FUNCTIONPAGE: (context) => FunctionPage(),
  INHERITEDWIDGETTESTROUTE: (context) => InheritedWidgetTestRoute(),
  PROVIDERPAGE: (context) => ProviderPage(),
  COLORPAGE: (context) => ColorPage(),
  AYSNUIPAGE: (context) => AysnUiPage(),
  DIALOGPAGE: (context) => DialogPage(),
  EVENTPAGE: (context) => EventPage(),
  IEVENTBUS: (context) => IEventBus(),
  NOTIFICATIONPAGE: (context) => NotificationPage(),
  ANIMPAGE: (context) => AnimPage(),
  HEROAPAGE: (context) => HeroAPage(),
  STAGGERROUTE: (context) => StaggerRoute(),
  ANIMSWITCHER: (context) => AnimSwitcher(),
  OVERANIMPAGE: (context) => OverAnimPage(),
};

import 'package:cross_design/src/base/cross_theme.dart';
import 'package:cross_design/src/base/cross_theme_mode.dart';
import 'package:cross_design/src/base/cross_widget.dart';
import 'package:cross_design/src/widgets/cupertino_app_compat.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:flutter/material.dart' as mat;
import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart' as mac;

class CrossApp extends CrossWidget {
  final CrossTheme theme;
  final CrossThemeMode themeMode;
  final bool _isRouter;
  // Other args
  /// {@macro flutter.widgets.widgetsApp.navigatorKey}
  final GlobalKey<NavigatorState>? navigatorKey;

  /// {@macro flutter.widgets.widgetsApp.home}
  final Widget? home;

  /// The application's top-level routing table.
  ///
  /// {@macro flutter.widgets.widgetsApp.routes}
  final Map<String, WidgetBuilder>? routes;

  /// {@macro flutter.widgets.widgetsApp.initialRoute}
  final String? initialRoute;

  /// {@macro flutter.widgets.widgetsApp.onGenerateRoute}
  final RouteFactory? onGenerateRoute;

  /// {@macro flutter.widgets.widgetsApp.onGenerateInitialRoutes}
  final InitialRouteListFactory? onGenerateInitialRoutes;

  /// {@macro flutter.widgets.widgetsApp.onUnknownRoute}
  final RouteFactory? onUnknownRoute;

  /// {@macro flutter.widgets.widgetsApp.navigatorObservers}
  final List<NavigatorObserver>? navigatorObservers;

  /// {@macro flutter.widgets.widgetsApp.routeInformationProvider}
  final RouteInformationProvider? routeInformationProvider;

  /// {@macro flutter.widgets.widgetsApp.routeInformationParser}
  final RouteInformationParser<Object>? routeInformationParser;

  /// {@macro flutter.widgets.widgetsApp.routerDelegate}
  final RouterDelegate<Object>? routerDelegate;

  /// {@macro flutter.widgets.widgetsApp.backButtonDispatcher}
  final BackButtonDispatcher? backButtonDispatcher;

  /// {@macro flutter.widgets.widgetsApp.routerConfig}
  final RouterConfig<Object>? routerConfig;

  /// {@macro flutter.widgets.widgetsApp.builder}
  final TransitionBuilder? builder;

  /// {@macro flutter.widgets.widgetsApp.title}
  ///
  /// This value is passed unmodified to [WidgetsApp.title].
  final String? title;

  /// {@macro flutter.widgets.widgetsApp.onGenerateTitle}
  ///
  /// This value is passed unmodified to [WidgetsApp.onGenerateTitle].
  final GenerateAppTitle? onGenerateTitle;

  /// {@macro flutter.widgets.widgetsApp.color}
  final Color? color;

  /// {@macro flutter.widgets.widgetsApp.locale}
  final Locale? locale;

  /// {@macro flutter.widgets.widgetsApp.localizationsDelegates}
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// {@macro flutter.widgets.widgetsApp.localeListResolutionCallback}
  ///
  /// This callback is passed along to the [WidgetsApp] built by this widget.
  final LocaleListResolutionCallback? localeListResolutionCallback;

  /// {@macro flutter.widgets.LocaleResolutionCallback}
  ///
  /// This callback is passed along to the [WidgetsApp] built by this widget.
  final LocaleResolutionCallback? localeResolutionCallback;

  /// {@macro flutter.widgets.widgetsApp.supportedLocales}
  ///
  /// It is passed along unmodified to the [WidgetsApp] built by this widget.
  final Iterable<Locale> supportedLocales;

  /// Turns on a performance overlay.
  ///
  /// See also:
  ///
  ///  * <https://flutter.dev/to/performance-overlay>
  final bool showPerformanceOverlay;

  /// Turns on an overlay that shows the accessibility information
  /// reported by the framework.
  final bool showSemanticsDebugger;

  /// {@macro flutter.widgets.widgetsApp.debugShowCheckedModeBanner}
  final bool debugShowCheckedModeBanner;

  /// {@macro flutter.widgets.widgetsApp.shortcuts}
  ///
  /// {@macro flutter.widgets.widgetsApp.shortcuts.seeAlso}
  final Map<LogicalKeySet, Intent>? shortcuts;

  /// {@macro flutter.widgets.widgetsApp.actions}
  ///
  /// {@macro flutter.widgets.widgetsApp.actions.seeAlso}
  final Map<Type, Action<Intent>>? actions;

  /// {@macro flutter.widgets.widgetsApp.restorationScopeId}
  final String? restorationScopeId;

  /// {@macro flutter.material.materialApp.scrollBehavior}
  ///
  /// When null, defaults to design-specific behaviour.
  ///
  /// See also:
  ///
  ///  * [ScrollConfiguration], which controls how [Scrollable] widgets behave
  ///    in a subtree.
  final ScrollBehavior? scrollBehavior;

  /// The default constructor
  const CrossApp({
    required this.theme,
    this.themeMode = CrossThemeMode.system,
    // Other args
    super.key,
    this.navigatorKey,
    this.home,
    Map<String, Widget Function(BuildContext)> this.routes =
        const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    List<NavigatorObserver> this.navigatorObservers =
        const <NavigatorObserver>[],
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.showPerformanceOverlay = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
  })  : _isRouter = false,
        routeInformationProvider = null,
        routeInformationParser = null,
        routerDelegate = null,
        backButtonDispatcher = null,
        routerConfig = null;

  /// Constructor with router
  const CrossApp.router({
    required this.theme,
    this.themeMode = CrossThemeMode.system,
    // Other args
    super.key,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.backButtonDispatcher,
    this.routerConfig,
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.showPerformanceOverlay = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
  })  : _isRouter = true,
        assert(routerDelegate != null || routerConfig != null),
        navigatorObservers = null,
        navigatorKey = null,
        onGenerateRoute = null,
        home = null,
        onGenerateInitialRoutes = null,
        onUnknownRoute = null,
        routes = null,
        initialRoute = null;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    if (_isRouter) {
      return CupertinoAppCompat.router(
        theme: theme,
        themeMode: themeMode,
        // Other args
        actions: actions,
        backButtonDispatcher: backButtonDispatcher,
        builder: builder,
        color: color,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        key: key,
        locale: locale,
        localeListResolutionCallback: localeListResolutionCallback,
        localeResolutionCallback: localeResolutionCallback,
        localizationsDelegates: localizationsDelegates,
        onGenerateTitle: onGenerateTitle,
        restorationScopeId: restorationScopeId,
        routeInformationParser: routeInformationParser,
        routeInformationProvider: routeInformationProvider,
        routerConfig: routerConfig,
        routerDelegate: routerDelegate,
        scrollBehavior: scrollBehavior,
        shortcuts: shortcuts,
        showPerformanceOverlay: showPerformanceOverlay,
        showSemanticsDebugger: showSemanticsDebugger,
        supportedLocales: supportedLocales,
        title: title,
      );
    } else {
      return CupertinoAppCompat(
        theme: theme,
        themeMode: themeMode,
        // Other args
        actions: actions,
        builder: builder,
        color: color,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        home: home,
        initialRoute: initialRoute,
        key: key,
        locale: locale,
        localeListResolutionCallback: localeListResolutionCallback,
        localeResolutionCallback: localeResolutionCallback,
        localizationsDelegates: localizationsDelegates,
        navigatorKey: navigatorKey,
        navigatorObservers: navigatorObservers ?? const <NavigatorObserver>[],
        onGenerateInitialRoutes: onGenerateInitialRoutes,
        onGenerateRoute: onGenerateRoute,
        onGenerateTitle: onGenerateTitle,
        onUnknownRoute: onUnknownRoute,
        restorationScopeId: restorationScopeId,
        routes: routes ?? const <String, WidgetBuilder>{},
        scrollBehavior: scrollBehavior,
        shortcuts: shortcuts,
        showPerformanceOverlay: showPerformanceOverlay,
        showSemanticsDebugger: showSemanticsDebugger,
        supportedLocales: supportedLocales,
        title: title,
      );
    }
  }

  @override
  Widget buildFluentWidget(BuildContext context) {
    if (_isRouter) {
      return flu.FluentApp.router(
        theme: theme.fluentLight,
        darkTheme: theme.fluentDark,
        themeMode: themeMode.toMaterial(),
        // Other args
        actions: actions,
        backButtonDispatcher: backButtonDispatcher,
        builder: builder,
        color: color,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        key: key,
        locale: locale,
        localeListResolutionCallback: localeListResolutionCallback,
        localeResolutionCallback: localeResolutionCallback,
        localizationsDelegates: localizationsDelegates,
        onGenerateTitle: onGenerateTitle,
        restorationScopeId: restorationScopeId,
        routeInformationParser: routeInformationParser,
        routeInformationProvider: routeInformationProvider,
        routerConfig: routerConfig,
        routerDelegate: routerDelegate,
        scrollBehavior: scrollBehavior ?? const flu.FluentScrollBehavior(),
        shortcuts: shortcuts,
        showPerformanceOverlay: showPerformanceOverlay,
        showSemanticsDebugger: showSemanticsDebugger,
        supportedLocales: supportedLocales,
        title: title ?? '',
      );
    } else {
      return flu.FluentApp(
        theme: theme.fluentLight,
        darkTheme: theme.fluentDark,
        themeMode: themeMode.toMaterial(),
        // Other args
        actions: actions,
        builder: builder,
        color: color,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        home: home,
        initialRoute: initialRoute,
        key: key,
        locale: locale,
        localeListResolutionCallback: localeListResolutionCallback,
        localeResolutionCallback: localeResolutionCallback,
        localizationsDelegates: localizationsDelegates,
        navigatorKey: navigatorKey,
        navigatorObservers: navigatorObservers ?? const <NavigatorObserver>[],
        onGenerateInitialRoutes: onGenerateInitialRoutes,
        onGenerateRoute: onGenerateRoute,
        onGenerateTitle: onGenerateTitle,
        onUnknownRoute: onUnknownRoute,
        restorationScopeId: restorationScopeId,
        routes: routes ?? const <String, WidgetBuilder>{},
        scrollBehavior: scrollBehavior ?? const flu.FluentScrollBehavior(),
        shortcuts: shortcuts,
        showPerformanceOverlay: showPerformanceOverlay,
        showSemanticsDebugger: showSemanticsDebugger,
        supportedLocales: supportedLocales,
        title: title ?? '',
      );
    }
  }

  @override
  Widget buildMacosWidget(BuildContext context) {
    if (_isRouter) {
      return mac.MacosApp.router(
        theme: theme.macosLight,
        darkTheme: theme.macosDark,
        themeMode: themeMode.toMaterial(),
        // Other args
        actions: actions,
        backButtonDispatcher: backButtonDispatcher,
        builder: builder,
        color: color,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        key: key,
        locale: locale,
        localeListResolutionCallback: localeListResolutionCallback,
        localeResolutionCallback: localeResolutionCallback,
        localizationsDelegates: localizationsDelegates,
        onGenerateTitle: onGenerateTitle,
        restorationScopeId: restorationScopeId,
        routeInformationParser: routeInformationParser,
        routeInformationProvider: routeInformationProvider,
        routerConfig: routerConfig,
        routerDelegate: routerDelegate,
        scrollBehavior: scrollBehavior ?? const mac.MacosScrollBehavior(),
        shortcuts: shortcuts,
        showPerformanceOverlay: showPerformanceOverlay,
        showSemanticsDebugger: showSemanticsDebugger,
        supportedLocales: supportedLocales,
        title: title ?? '',
      );
    } else {
      return mac.MacosApp(
        theme: theme.macosLight,
        darkTheme: theme.macosDark,
        themeMode: themeMode.toMaterial(),
        // Other args
        actions: actions,
        builder: builder,
        color: color,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        home: home,
        initialRoute: initialRoute,
        key: key,
        locale: locale,
        localeListResolutionCallback: localeListResolutionCallback,
        localeResolutionCallback: localeResolutionCallback,
        localizationsDelegates: localizationsDelegates,
        navigatorKey: navigatorKey,
        navigatorObservers: navigatorObservers ?? const <NavigatorObserver>[],
        onGenerateInitialRoutes: onGenerateInitialRoutes,
        onGenerateRoute: onGenerateRoute,
        onGenerateTitle: onGenerateTitle,
        onUnknownRoute: onUnknownRoute,
        restorationScopeId: restorationScopeId,
        routes: routes ?? const <String, WidgetBuilder>{},
        scrollBehavior: scrollBehavior ?? const mac.MacosScrollBehavior(),
        shortcuts: shortcuts,
        showPerformanceOverlay: showPerformanceOverlay,
        showSemanticsDebugger: showSemanticsDebugger,
        supportedLocales: supportedLocales,
        title: title ?? '',
      );
    }
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    if (_isRouter) {
      return mat.MaterialApp.router(
        theme: theme.materialLight,
        darkTheme: theme.materialDark,
        highContrastTheme: theme.materialHighContrastLight,
        highContrastDarkTheme: theme.materialHighContrastDark,
        themeMode: themeMode.toMaterial(),
        // Other args
        actions: actions,
        backButtonDispatcher: backButtonDispatcher,
        builder: builder,
        color: color,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        key: key,
        locale: locale,
        localeListResolutionCallback: localeListResolutionCallback,
        localeResolutionCallback: localeResolutionCallback,
        localizationsDelegates: localizationsDelegates,
        onGenerateTitle: onGenerateTitle,
        restorationScopeId: restorationScopeId,
        routeInformationParser: routeInformationParser,
        routeInformationProvider: routeInformationProvider,
        routerConfig: routerConfig,
        routerDelegate: routerDelegate,
        scrollBehavior: scrollBehavior,
        shortcuts: shortcuts,
        showPerformanceOverlay: showPerformanceOverlay,
        showSemanticsDebugger: showSemanticsDebugger,
        supportedLocales: supportedLocales,
        title: title,
      );
    } else {
      return mat.MaterialApp(
        theme: theme.materialLight,
        darkTheme: theme.materialDark,
        highContrastTheme: theme.materialHighContrastLight,
        highContrastDarkTheme: theme.materialHighContrastDark,
        themeMode: themeMode.toMaterial(),
        // Other args
        actions: actions,
        builder: builder,
        color: color,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        home: home,
        initialRoute: initialRoute,
        key: key,
        locale: locale,
        localeListResolutionCallback: localeListResolutionCallback,
        localeResolutionCallback: localeResolutionCallback,
        localizationsDelegates: localizationsDelegates,
        navigatorKey: navigatorKey,
        navigatorObservers: navigatorObservers ?? const <NavigatorObserver>[],
        onGenerateInitialRoutes: onGenerateInitialRoutes,
        onGenerateRoute: onGenerateRoute,
        onGenerateTitle: onGenerateTitle,
        onUnknownRoute: onUnknownRoute,
        restorationScopeId: restorationScopeId,
        routes: routes ?? const <String, WidgetBuilder>{},
        scrollBehavior: scrollBehavior,
        shortcuts: shortcuts,
        showPerformanceOverlay: showPerformanceOverlay,
        showSemanticsDebugger: showSemanticsDebugger,
        supportedLocales: supportedLocales,
        title: title,
      );
    }
  }

  @override
  Widget buildYaruWidget(BuildContext context) {
    return buildMaterialWidget(context);
  }
}

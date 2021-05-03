import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:raro_test/app/styles/app_color_scheme.dart';

const double _kLeadingWidth = kToolbarHeight;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.title,
   required  this.leading,
     required this.actions,
    this.showShadow = true,
    required this.backgroundColor,
    required this.appBarHeight,
    required this.appBarRadius,
  }) : super(key: key);

  final double? appBarHeight;
  final double? appBarRadius;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? showShadow;
  final Color Function()? backgroundColor;

  @override
  Widget build(BuildContext context) {
    // final ScaffoldState scaffold = Scaffold.of(context, nullOk: true);
    final ThemeData theme = Theme.of(context);
    final AppBarTheme appBarTheme = AppBarTheme.of(context);

    // final bool hasDrawer = scaffold?.hasDrawer ?? false;

    Widget actionsRow;
    if (actions != null) {
      actionsRow = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: actions!,
      );
    }

    Widget leadingRow = ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: _kLeadingWidth),
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: leading ?? BackButton(),
      ),
    );

    if (title != null) {

      bool namesRoute;
      switch (theme.platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          namesRoute = true;
          break;
        case TargetPlatform.iOS:
          break;
        case TargetPlatform.linux:
          break;
        case TargetPlatform.macOS:
          break;
        case TargetPlatform.windows:
          break;
      }

    }

    final Widget toolbar = NavigationToolbar(
      leading: leadingRow,
      middle: title,
  //    trailing: actionsRow,
      centerMiddle: true,
    );

    Widget appBar = SafeArea(
      child: ClipRect(
        child: toolbar,
      ),
    );

    appBar = Align(
      alignment: Alignment.topCenter,
      child: appBar,
    );

    final Brightness brightness =
        appBarTheme.brightness ?? theme.primaryColorBrightness;
    final SystemUiOverlayStyle overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    Widget _containerAppBar() => Container(
          decoration: BoxDecoration(
            boxShadow: showShadow!
                ? [
                    BoxShadow(
                      color: AppColorScheme.shadowColorDark,
                      offset: Offset(0, 3.0),
                      blurRadius: 15.0,
                    )
                  ]
                : [],
            color: backgroundColor == null ? null : backgroundColor!(),
          ),
          child: Material(
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(appBarRadius!),
                bottomRight: Radius.circular(appBarRadius!),
              ),
            ),
            child: Semantics(
              explicitChildNodes: true,
              child: appBar,
            ),
          ),
        );

    return Semantics(
      container: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: backgroundColor == null
            ? _containerAppBar()
            : Observer(builder: (_) {
                return _containerAppBar();
              }),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight!);
}

// Layout the AppBar's title with unconstrained height, vertically
// center it within its (NavigationToolbar) parent, and allow the
// parent to constrain the title's actual height.
class _AppBarTitleBox extends SingleChildRenderObjectWidget {
  const _AppBarTitleBox({Key? key, @required Widget? child})
      : assert(child != null),
        super(key: key, child: child);

  @override
  _RenderAppBarTitleBox createRenderObject(BuildContext context) {
    return _RenderAppBarTitleBox(
      textDirection: Directionality.of(context),
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderAppBarTitleBox renderObject) {
    renderObject.textDirection = Directionality.of(context);
  }
}

class _RenderAppBarTitleBox extends RenderAligningShiftedBox {
  _RenderAppBarTitleBox({
    RenderBox? child,
    TextDirection? textDirection,
  }) : super(
            alignment: Alignment.center,
            textDirection: textDirection,
            child: child);

  @override
  void performLayout() {
    final BoxConstraints constraints = this.constraints;
    final BoxConstraints innerConstraints =
        constraints.copyWith(maxHeight: double.infinity);
    child!.layout(innerConstraints, parentUsesSize: true);
    size = constraints.constrain(child!.size);
    alignChild();
  }
}

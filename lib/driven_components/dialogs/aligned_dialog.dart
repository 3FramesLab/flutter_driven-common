part of driven_components_module;

Future<T?> showAlignedDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Alignment followerAnchor = Alignment.center,
  Alignment targetAnchor = Alignment.center,
}) {
  final CapturedThemes themes = InheritedTheme.capture(
    from: context,
    to: Navigator.of(
      context,
      rootNavigator: true,
    ).context,
  );

  final RenderBox targetBox = context.findRenderObject() as RenderBox;
  final RenderBox overlay =
      Navigator.of(context).overlay?.context.findRenderObject() as RenderBox;

  final position = targetBox
      .localToGlobal(targetAnchor.alongSize(targetBox.size), ancestor: overlay);
  final newPosition = Offset(position.dx, position.dy - 5);

  return Navigator.of(context, rootNavigator: true)
      .push<T>(AlignedDialogRoute<T>(
    followerAlignment: followerAnchor,
    position: newPosition,
    context: context,
    builder: builder,
    barrierColor: DrivenColors.black54,
    themes: themes,
    avoidOverflow: true,
  ));
}

class AlignedDialogRoute<T> extends RawDialogRoute<T> {
  AlignedDialogRoute({
    required BuildContext context,
    required WidgetBuilder builder,
    required Alignment followerAlignment,
    required Offset position,
    CapturedThemes? themes,
    Color? barrierColor = DrivenColors.transparent,
    bool barrierDismissible = true,
    String? barrierLabel,
    bool useSafeArea = true,
    RouteSettings? settings,
    RouteTransitionsBuilder? transitionsBuilder,
    Duration? duration,
    bool avoidOverflow = false,
    Offset offset = Offset.zero,
  }) : super(
          pageBuilder: (buildContext, animation, secondaryAnimation) {
            final Widget pageChild = Builder(builder: builder);
            Widget dialog = Builder(
              builder: (context) {
                final MediaQueryData mediaQuery = MediaQuery.of(context);
                return CustomSingleChildLayout(
                  delegate: _FollowerDialogRouteLayout(
                    followerAnchor: followerAlignment,
                    position: position,
                    textDirection: Directionality.of(context),
                    topPadding: mediaQuery.padding.top,
                    bottomPadding: mediaQuery.padding.bottom,
                    offset: offset,
                    avoidOverflow: avoidOverflow,
                  ),
                  child: pageChild,
                );
              },
            );
            dialog = themes?.wrap(dialog) ?? dialog;
            if (useSafeArea) {
              dialog = _safeArea(dialog);
            }
            return dialog;
          },
          barrierDismissible: barrierDismissible,
          barrierColor: barrierColor,
          barrierLabel: barrierLabel ??
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          transitionDuration: duration ?? const Duration(milliseconds: 200),
          transitionBuilder:
              transitionsBuilder ?? _buildMaterialDialogTransitions,
          settings: settings,
        );

  static Widget _safeArea(Widget child) => SafeArea(
        left: false,
        top: false,
        right: false,
        child: child,
      );
}

class _FollowerDialogRouteLayout extends SingleChildLayoutDelegate {
  _FollowerDialogRouteLayout({
    required this.followerAnchor,
    required this.position,
    required this.textDirection,
    required this.topPadding,
    required this.bottomPadding,
    required this.offset,
    required this.avoidOverflow,
  });

  final Alignment followerAnchor;

  final Offset position;

  final TextDirection textDirection;

  final double topPadding;

  final double bottomPadding;

  final Offset offset;
  final bool avoidOverflow;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.loose(constraints.biggest)
        .deflate(EdgeInsets.only(top: topPadding, bottom: bottomPadding));
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    Offset rst = followerAnchor.alongSize(childSize);
    rst = position - rst;
    rst += offset;
    if (avoidOverflow) {
      if (rst.dx < 0) {
        rst = Offset(0, rst.dy);
      }
      if (rst.dy < 0) {
        rst = Offset(rst.dx, 0);
      }
      if (rst.dx + childSize.width > size.width) {
        rst = Offset(size.width - childSize.width, rst.dy);
      }
      if (rst.dy + childSize.height > size.height) {
        rst = Offset(rst.dx, size.height - childSize.height);
      }
    }
    return rst;
  }

  @override
  bool shouldRelayout(_FollowerDialogRouteLayout oldDelegate) {
    return followerAnchor != oldDelegate.followerAnchor ||
        position != oldDelegate.position ||
        offset != oldDelegate.offset ||
        avoidOverflow != oldDelegate.avoidOverflow ||
        textDirection != oldDelegate.textDirection ||
        topPadding != oldDelegate.topPadding ||
        bottomPadding != oldDelegate.bottomPadding;
  }
}

Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  return FadeTransition(
    opacity: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}

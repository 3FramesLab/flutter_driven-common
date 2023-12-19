part of driven_components_module;

class DrivenColumn extends StatelessWidget {
  final List<Widget> children;
  final Color? color;
  final CrossAxisAlignment crossAxisAlignment;
  final Decoration? decoration;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final double? minHeight;
  final EdgeInsets? padding;

  const DrivenColumn({
    key,
    this.color,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.decoration,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.minHeight,
    this.padding,
    this.children = const <Widget>[],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      constraints: _constraints(),
      decoration: decoration,
      padding: padding,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: children,
      ),
    );
  }

  BoxConstraints? _constraints() {
    if (minHeight != null) {
      return BoxConstraints(minHeight: minHeight!);
    }
    return null;
  }
}

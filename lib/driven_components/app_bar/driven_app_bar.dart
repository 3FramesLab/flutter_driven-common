part of driven_components_module;

class DrivenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final Color backgroundColor;
  final bool centerTitle;
  final Widget? title;
  final Widget? leading;
  final Widget? flexibleSpace;
  final double? toolBarHeight;
  final EdgeInsetsGeometry padding;
  final double titleSpacing;

  @override
  final Size preferredSize;

  DrivenAppBar({
    Key? key,
    this.actions,
    this.backgroundColor = DrivenColors.lightestGrey,
    this.centerTitle = true,
    this.title,
    this.leading,
    this.flexibleSpace,
    this.toolBarHeight,
    this.padding = const EdgeInsets.fromLTRB(12, 0, 12, 0),
    this.titleSpacing = 10,
  })  : preferredSize = Size.fromHeight(toolBarHeight ?? kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: AppBar(
        actions: actions,
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
        centerTitle: centerTitle,
        elevation: 0,
        leading: leading,
        leadingWidth: 60,
        title: title,
        flexibleSpace: flexibleSpace,
        toolbarHeight: toolBarHeight,
        titleSpacing: titleSpacing,
      ),
    );
  }
}

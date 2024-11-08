part of driven_components_module;

class MenuRow extends StatelessWidget {
  const MenuRow({
    required this.title,
    required this.icon,
    this.buttonAction,
    this.backgroundColor = Colors.transparent,
    this.subTitle,
    this.subTitleStyle,
    super.key,
  });

  final String title;
  final void Function()? buttonAction;
  final IconData icon;
  final Color backgroundColor;
  final String? subTitle;
  final TextStyle? subTitleStyle;

  @override
  Widget build(BuildContext context) {
    return _bodyContainer(
      onTap: buttonAction,
      title: _buildTitle(context),
      subtitle: _buildSubTitle(),
      leading: CircleIcon(icon: icon),
    );
  }

  Widget _bodyContainer({
    void Function()? onTap,
    Widget? title,
    Widget? subtitle,
    Widget? leading,
  }) {
    return SizedBox(
      height: 70,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 15,
        ),
        onTap: onTap,
        dense: true,
        title: title,
        subtitle: subtitle,
        leading: leading,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    Widget titleWidget = Text(
      title,
      style: Theme.of(context).textTheme.titleMedium,
    );

    if (subTitle == null) {
      titleWidget = Align(
        alignment: Alignment.centerLeft,
        child: titleWidget,
      );
    }

    return titleWidget;
  }

  Widget? _buildSubTitle() {
    if (subTitle != null) {
      return Text(
        subTitle!,
        style: subTitleStyle,
      );
    }
    return null;
  }
}

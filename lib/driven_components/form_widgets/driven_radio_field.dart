part of driven_components_module;

class DrivenRadioField extends StatelessWidget {
  final List<Widget> options;
  final List<Widget> titleIcons;
  final String titleText;
  final RadioFieldDisplay? radioFieldDisplay;
  final EdgeInsets padding;

  const DrivenRadioField({
    required this.options,
    required this.titleText,
    this.titleIcons = const [],
    this.padding = EdgeInsets.zero,
    this.radioFieldDisplay = RadioFieldDisplay.row,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Semantics(
                container: true,
                child: PaddedText(
                  titleText,
                  padding: padding,
                  style: f14SemiboldGrey,
                ),
              ),
            ),
            ...titleIcons,
          ],
        ),
        if (radioFieldDisplay != RadioFieldDisplay.column)
          Semantics(
            container: true,
            child: Row(children: options),
          ),
        if (radioFieldDisplay == RadioFieldDisplay.column)
          Semantics(
            container: true,
            child: Column(children: options),
          ),
      ],
    );
  }
}

enum RadioFieldDisplay {
  row,
  column,
}

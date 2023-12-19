part of driven_components_module;

class DarkPanelTitle extends StatelessWidget {
  final String title;

  const DarkPanelTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 36, bottom: 20),
      child: H1Semibold24(title),
    );
  }
}

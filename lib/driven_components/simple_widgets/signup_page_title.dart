part of driven_components_module;

class SignupTitle extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry padding;

  const SignupTitle({
    required this.title,
    this.padding = const EdgeInsets.only(top: 36, bottom: 14),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: H1Extrabold28(title),
    );
  }
}

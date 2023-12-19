part of driven_components_module;

class BigDrivenLogo extends StatelessWidget {
  const BigDrivenLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return DrivenColumn(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 20),
      children: [
        Image.asset('assets/images/logo.png'),
      ],
    );
  }
}

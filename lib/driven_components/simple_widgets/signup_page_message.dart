part of driven_components_module;

class SignupPageMessage extends StatelessWidget {
  final String message;

  const SignupPageMessage(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedText(
      message,
      padding: const EdgeInsets.only(bottom: 30),
    );
  }
}

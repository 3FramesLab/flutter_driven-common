part of driven_components_module;

class ToggleSwitchContainer extends StatelessWidget {
  final Widget child;
  const ToggleSwitchContainer({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return getContainer();
  }

  Container getContainer() {
    return Container(
      width: 55,
      height: 35,
      decoration: const BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: child,
    );
  }
}

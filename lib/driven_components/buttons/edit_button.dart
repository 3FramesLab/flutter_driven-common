part of driven_components_module;

class EditButton extends StatelessWidget {
  final String route;

  const EditButton({
    required this.route,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Get.toNamed('$route?edit'),
      icon: const Icon(Icons.create_sharp),
      iconSize: 20,
    );
  }
}

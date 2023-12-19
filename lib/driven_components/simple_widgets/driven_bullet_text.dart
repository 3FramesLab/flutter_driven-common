part of driven_components_module;

class DrivenBulletText extends StatelessWidget {
  const DrivenBulletText(this.item, {super.key});
  final String item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Wrap(
        children: [
          const Text('\u2022', style: TextStyle(fontSize: 15)),
          const HorizontalSpacer.small(),
          Text(item)
        ],
      ),
    );
  }
}

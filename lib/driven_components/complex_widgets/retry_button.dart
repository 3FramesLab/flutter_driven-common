part of driven_components_module;

class RetryButton extends StatelessWidget {
  final String retryRoute;

  const RetryButton({super.key, this.retryRoute = ''});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _buttonAction,
      child: const Text(DrivenConstants.retry),
    );
  }

  Future<void> _buttonAction() async {
    if (retryRoute != '') {
      await Get.offNamed(retryRoute);
    } else {
      Get.back();
    }
  }
}

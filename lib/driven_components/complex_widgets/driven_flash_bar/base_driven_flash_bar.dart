part of driven_components_module;

class BaseDrivenFlashBar {
  static void show({
    String message = DrivenConstants.somethingWentWrong,
    String code = '',
    DrivenFlashAction? action,
    MessageType type = MessageType.error,
  }) {
    DrivenFlashMessage.dismiss();
    DrivenFlashMessage().createView(message, code, type, action);
  }
}

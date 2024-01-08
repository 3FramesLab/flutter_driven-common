part of driven_components_module;

class BaseDrivenFlashBar {
  static void show({
    String message = DrivenConstants.somethingWentWrong,
    String code = '',
    int duration = DrivenConstants.flashMessageDuration,
    MessageType type = MessageType.error,
    Function()? onRemoteMessageTap,
  }) {
    DrivenFlashMessage.dismiss();
    DrivenFlashMessage().createView(
      message,
      code,
      duration,
      type,
      onRemoteMessageNotificationTap: onRemoteMessageTap,
    );
  }
}

part of styles_module;

class DrivenRectangleBorder extends RoundedRectangleBorder {
  const DrivenRectangleBorder.withRadius({super.borderRadius});

  static const DrivenRectangleBorder basic = DrivenRectangleBorder.withRadius(
    borderRadius: BorderRadius.all(basicRadius),
  );

  static const DrivenRectangleBorder mediumRounded =
      DrivenRectangleBorder.withRadius(
    borderRadius: BorderRadius.all(mediumRoundedRadius),
  );

  static const DrivenRectangleBorder mediumRoundedBottom =
      DrivenRectangleBorder.withRadius(
    borderRadius: BorderRadius.only(
      topRight: basicRadius,
      topLeft: basicRadius,
      bottomLeft: mediumRoundedRadius,
      bottomRight: mediumRoundedRadius,
    ),
  );

  static const DrivenRectangleBorder mediumRoundedTop =
      DrivenRectangleBorder.withRadius(
    borderRadius: BorderRadius.only(
      topRight: mediumRoundedRadius,
      topLeft: mediumRoundedRadius,
      bottomLeft: basicRadius,
      bottomRight: basicRadius,
    ),
  );

  static const DrivenRectangleBorder veryRounded =
      DrivenRectangleBorder.withRadius(
    borderRadius: BorderRadius.all(veryRoundedRadius),
  );

  static const Radius basicRadius = Radius.circular(1);
  static const Radius mediumRoundedRadius = Radius.circular(10);
  static const Radius veryRoundedRadius = Radius.circular(25);
}

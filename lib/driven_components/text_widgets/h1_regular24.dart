part of driven_components_module;

class H1Regular24 extends Text {
  // Should this have line height 41?
  H1Regular24(
    String data, {
    super.key,
    TextStyle style = const TextStyle(),
  }) : super(
          data,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black,
          ).merge(style),
          textAlign: TextAlign.center,
        );
}

class H1Semibold24 extends H1Regular24 {
  H1Semibold24(String data, {super.key})
      : super(
          data,
          style: const TextStyle(
            fontWeight: DrivenFonts.fontWeightSemibold,
          ),
        );
}

class H1Extrabold28 extends H1Regular24 {
  H1Extrabold28(String data, {super.key})
      : super(
          data,
          style: const TextStyle(
            fontWeight: DrivenFonts.fontWeightExtraBold,
            fontSize: 28,
          ),
        );
}

class H1SemiBold24White extends H1Regular24 {
  H1SemiBold24White(String data, {super.key})
      : super(
          data,
          style: const TextStyle(
            fontWeight: DrivenFonts.fontWeightSemibold,
            color: Colors.white,
          ),
        );
}

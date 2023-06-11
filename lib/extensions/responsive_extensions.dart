extension ResponsiveExtensions on num {
  /// Returns a [true] if the value is smaller or equal to [600]
  bool get isMobileGenericSize => this <= 600;

  /// Returns a [true] if the [isMobileGenericSize] is [false] and the value is smaller or equal to [1000]
  bool get isTabletGenericSize => !isMobileGenericSize && this <= 1000;

  /// Returns a [true] if the [isTabletGenericSize] is [false]
  bool get isDesktopGenericSize => !isTabletGenericSize;
}

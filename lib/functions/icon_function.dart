class IconFuntion {
  // function for the weather icon according to the api weather condition
  static String getIcon(String iconName) {
    switch (iconName) {
      case "Extreme":
        return "assets/breeze.png";
      case "Cloudy":
        return "assets/cloud.png";
      case "Haze":
        return "assets/cloudy.png";
      case "Rain":
        return "assets/rain.png";
      case "Clear":
        return "assets/sun.png";
      default:
        return "assets/sun.png";
    }
  }
}

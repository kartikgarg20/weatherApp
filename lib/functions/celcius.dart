class ConvertC {
  // for the conversion of the kelvin to celsius
  static int letConvert({required double kelvin}) {
    int celsius = (kelvin - 273.15).toInt();
    return celsius;
  }
}

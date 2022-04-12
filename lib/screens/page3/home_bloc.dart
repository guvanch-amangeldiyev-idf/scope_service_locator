class HomeDataPage3 {
  int counter = 0;

  HomeDataPage3(this.counter);

  factory HomeDataPage3.init() => HomeDataPage3(0);

  HomeDataPage3 copy() => HomeDataPage3(counter);
}

class HomeData {
  int counter = 0;

  HomeData(this.counter);

  factory HomeData.init() => HomeData(0);

  HomeData copy() => HomeData(counter);
}

import 'package:hooks_riverpod/hooks_riverpod.dart';

class Detail1 extends StateNotifier<bool> {
  Detail1() : super(false);
  setD(bool tf) {
    state = !tf;
  }
}

final detail1Provider = StateNotifierProvider<Detail1, bool>((ref) {
  return Detail1();
});

class Detail2 extends StateNotifier<bool> {
  Detail2() : super(false);
  setD(bool tf) {
    state = !tf;
  }
}

final detail2Provider = StateNotifierProvider<Detail2, bool>((ref) {
  return Detail2();
});

class Detail3 extends StateNotifier<bool> {
  Detail3() : super(false);
  setD(bool tf) {
    state = !tf;
  }
}

final detail3Provider = StateNotifierProvider<Detail3, bool>((ref) {
  return Detail3();
});

class Detail4 extends StateNotifier<bool> {
  Detail4() : super(false);
  setD(bool tf) {
    state = !tf;
  }
}

final detail4Provider = StateNotifierProvider<Detail4, bool>((ref) {
  return Detail4();
});

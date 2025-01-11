import 'package:hooks_riverpod/hooks_riverpod.dart';

class NowDate extends StateNotifier<DateTime> {
  NowDate() : super(DateTime.now());
  setDate(DateTime now) {
    state = now;
  }
}

final nowDateProvider = StateNotifierProvider<NowDate, DateTime>((ref) {
  return NowDate();
});

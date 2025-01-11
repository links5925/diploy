import 'package:diploy/model/portfolio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImagePick extends StateNotifier<Portfolio?> {
  ImagePick() : super(null);
  setNull() {
    state = null;
  }

  setP(Portfolio p) {
    state = p;
  }
}

final mainPPorProvider = StateNotifierProvider<ImagePick, Portfolio?>((ref) {
  return ImagePick();
});

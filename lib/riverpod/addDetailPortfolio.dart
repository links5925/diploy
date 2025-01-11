import 'dart:io';

import 'package:diploy/model/portfolio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddDetailPortfolio extends StateNotifier<PostPortfolio> {
  AddDetailPortfolio()
      : super(PostPortfolio(null, null, null, null, null, null, null));
  setNull() {
    state = PostPortfolio(null, null, null, null, null, null, null);
  }

  setName(String name) {
    state = PostPortfolio(state.id, name, state.q1, state.q2, state.q3,
        state.image, state.category);
  }

  setQ1(String a) {
    state = PostPortfolio(state.id, state.name, a, state.q2, state.q3,
        state.image, state.category);
  }

  setQ2(String a) {
    state = PostPortfolio(state.id, state.name, state.q1, a, state.q3,
        state.image, state.category);
  }

  setQ3(String a) {
    state = PostPortfolio(state.id, state.name, state.q1, state.q2, a,
        state.image, state.category);
  }

  setImage(File file) {
    state = PostPortfolio(state.id, state.name, state.q1, state.q2, state.q3,
        file, state.category);
  }

  setCategory(int category) {
    state = PostPortfolio(state.id, state.name, state.q1, state.q2, state.q3,
        state.image, category);
  }
}

final addDetailProvider =
    StateNotifierProvider<AddDetailPortfolio, PostPortfolio>((ref) {
  return AddDetailPortfolio();
});

import 'package:diploy/model/portfolio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Portfolios extends StateNotifier<List<Portfolio>> {
  Portfolios() : super([pdu]);
  setPortfolios(List<Portfolio> portfolios) {
    state = portfolios;
  }

  addPortfolios(Portfolio portfolio) {
    state = [...state, portfolio];
  }
}

final portfoliosProvider =
    StateNotifierProvider<Portfolios, List<Portfolio>>((ref) {
  return Portfolios();
});

Portfolio pdu = Portfolio(
    DateTime(2025, 1, 2),
    '1',
    'name',
    'q1',
    'q2',
    'q3',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5WcyNaTEeVOHoYePQyKq0adQ5rzGCpk2ZPA&s',
    1);

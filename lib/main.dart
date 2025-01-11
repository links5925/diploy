import 'package:diploy/model/portfolio.dart';
import 'package:diploy/pages/DetailPortfolio.dart';
import 'package:diploy/pages/myPage.dart';
import 'package:diploy/riverpod/mainPagePortfolio.dart';
import 'package:diploy/riverpod/nowDate.dart';
import 'package:diploy/riverpod/portfolios.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  Portfolio? _getEventsForDay(List<Portfolio> pts, DateTime day) {
    {
      for (Portfolio pt in pts) {
        if (pt.dateTime.year == day.year &&
            pt.dateTime.month == day.month &&
            pt.dateTime.day == day.day) {
          return pt;
        }
      }
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          color: Colors.white,
        ),
        SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('Date'),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.account_circle_rounded,
                    size: 36,
                    color: Color(0xff8AD1F7),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Mypage(),
                        ));
                  },
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 402,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0)
                        ]),
                    child: TableCalendar(
                      calendarBuilders: CalendarBuilders(
                        selectedBuilder: (context, day, focusedDay) {
                          Portfolio? eventsForDay = _getEventsForDay(
                              ref.watch(portfoliosProvider), day);
                          if (eventsForDay != null) {
                            return Container(
                              decoration: const BoxDecoration(
                                color: Color(0xff8AD1F7),
                                shape: BoxShape.circle,
                              ),
                              child: eventsForDay.url != null
                                  ? ClipOval(
                                      child: Image.network(eventsForDay.url!,
                                          width: 30,
                                          height: 30,
                                          fit: BoxFit.cover),
                                    )
                                  : null,
                            );
                          } else {
                            return null;
                          }
                        },
                        defaultBuilder: (context, day, focusedDay) {
                          Portfolio? eventsForDay = _getEventsForDay(
                              ref.watch(portfoliosProvider), day);
                          if (eventsForDay != null) {
                            return Container(
                              decoration: const BoxDecoration(
                                color: Color(0xff8AD1F7),
                                shape: BoxShape.circle,
                              ),
                              child: eventsForDay.url != null
                                  ? ClipOval(
                                      child: Image.network(eventsForDay.url!,
                                          width: 30,
                                          height: 30,
                                          fit: BoxFit.cover),
                                    )
                                  : null,
                            );
                          } else {
                            return null;
                          }
                        },
                      ),
                      availableCalendarFormats: const {
                        CalendarFormat.month: ''
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        ref.read(nowDateProvider.notifier).setDate(focusedDay);
                        Portfolio? pt = _getEventsForDay(
                            ref.watch(portfoliosProvider), selectedDay);
                        if (pt == null) {
                          ref.read(mainPPorProvider.notifier).setNull();
                        } else {
                          ref.read(mainPPorProvider.notifier).setP(pt);
                        }
                      },
                      focusedDay: ref.watch(nowDateProvider),
                      currentDay: ref.watch(nowDateProvider),
                      firstDay: DateTime(2024, 1, 1),
                      lastDay: DateTime(2026, 1, 1),
                      calendarStyle: const CalendarStyle(
                          todayDecoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffD6ECF7))),
                    ),
                  ),
                  const SizedBox(height: 23),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '${ref.watch(nowDateProvider).day}',
                                  style: const TextStyle(fontSize: 24),
                                ),
                                Text(DateFormat('E')
                                    .format(ref.watch(nowDateProvider))),
                              ],
                            ),
                            const SizedBox(width: 26),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Today’s Diary',
                                    style: TextStyle(fontSize: 16)),
                                SizedBox(height: 5),
                                Text(ref.watch(mainPPorProvider) == null
                                    ? ''
                                    : '${ref.watch(mainPPorProvider)!.name!}'),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 6),
                            Container(
                              width: 7,
                              height: 259,
                              decoration: ShapeDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment(0.00, -1.00),
                                  end: Alignment(0, 1),
                                  colors: [
                                    Color(0x338AD1F7),
                                    Color(0xFF8AD1F7)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(width: 37),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const DetailportfolioWrite(),
                                        ));
                                  },
                                  child: Container(
                                    width: 300,
                                    padding: const EdgeInsets.only(
                                        top: 14, left: 8, right: 8, bottom: 14),
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFD6ECF7),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Q1.오늘의 활동을 통해 무엇을 배웠나요?'),
                                        Text(ref.watch(mainPPorProvider) == null
                                            ? 'A1.'
                                            : 'A1.${ref.watch(mainPPorProvider)!.q1!}')
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailportfolioWrite(),
                                        ));
                                  },
                                  child: Container(
                                      width: 300,
                                      padding: const EdgeInsets.only(
                                          top: 14,
                                          left: 8,
                                          right: 8,
                                          bottom: 14),
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFD6ECF7),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Q2.가장 기억에 남는 경험은 무엇인가요?'),
                                          Text(ref.watch(mainPPorProvider) ==
                                                  null
                                              ? 'A2.'
                                              : 'A2.${ref.watch(mainPPorProvider)!.q2!}')
                                        ],
                                      )),
                                ),
                                SizedBox(height: 20),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailportfolioWrite(),
                                        ));
                                  },
                                  child: Container(
                                      width: 300,
                                      padding: const EdgeInsets.only(
                                          top: 14,
                                          left: 8,
                                          right: 8,
                                          bottom: 14),
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFD6ECF7),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                              'Q3. 어려웠던 점은 무엇이고, 어떻게 해결하였나요?'),
                                          Text(ref.watch(mainPPorProvider) ==
                                                  null
                                              ? 'A3.'
                                              : 'A3.${ref.watch(mainPPorProvider)!.q3!}')
                                        ],
                                      )),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

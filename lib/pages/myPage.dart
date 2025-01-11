import 'package:diploy/riverpod/myPageDetail.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Mypage extends ConsumerStatefulWidget {
  const Mypage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MypageState();
}

class _MypageState extends ConsumerState<Mypage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        ref.read(detail1Provider.notifier).setD(false);
        ref.read(detail2Provider.notifier).setD(false);
        ref.read(detail3Provider.notifier).setD(false);
        ref.read(detail4Provider.notifier).setD(false);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(title: const Text('내 페이지'), backgroundColor: Colors.white),
      body: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                )
              ],
            ),
            child: const Column(
              children: [
                SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Icon(
                      Icons.account_circle_outlined,
                      size: 80,
                      color: Color(0xff8AD1F7),
                    ),
                    SizedBox(width: 28),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('삐약이', style: TextStyle(fontSize: 24)),
                        SizedBox(height: 5),
                        Text('이공이오대학교', style: TextStyle(fontSize: 16)),
                        Text('학과 이공학년 이오학기', style: TextStyle(fontSize: 16)),
                        Text('전체평점: 2.0 / 전공평점: 2.5',
                            style: TextStyle(fontSize: 16)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Column(children: [
            const SizedBox(height: 45),
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).width - 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ]),
                padding: const EdgeInsets.only(left: 28, right: 22),
                height: 72,
                child: Row(
                  children: [
                    Icon(Icons.terminal, size: 28),
                    SizedBox(width: 15),
                    Text(
                      '공모전 및 프로젝트',
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(detail1Provider.notifier)
                            .setD(ref.watch(detail1Provider));
                      },
                      child: Icon(
                          ref.watch(detail1Provider) == false
                              ? Icons.keyboard_arrow_down_rounded
                              : Icons.keyboard_arrow_up_rounded,
                          size: 36),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 28),
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).width - 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                          spreadRadius: 0)
                    ]),
                padding: const EdgeInsets.only(left: 28, right: 22),
                height: 72,
                child: Row(
                  children: [
                    Icon(Icons.contact_emergency_outlined, size: 28),
                    SizedBox(width: 15),
                    Text(
                      '자격증',
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(detail2Provider.notifier)
                            .setD(ref.watch(detail2Provider));
                      },
                      child: Icon(
                          ref.watch(detail2Provider) == false
                              ? Icons.keyboard_arrow_down_rounded
                              : Icons.keyboard_arrow_up_rounded,
                          size: 36),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 28),
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).width - 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ]),
                padding: const EdgeInsets.only(left: 28, right: 22),
                height: 72,
                child: Row(
                  children: [
                    Icon(Icons.font_download_outlined, size: 28),
                    SizedBox(width: 15),
                    Text(
                      '어학연수',
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(detail3Provider.notifier)
                            .setD(ref.watch(detail3Provider));
                      },
                      child: Icon(
                          ref.watch(detail3Provider) == false
                              ? Icons.keyboard_arrow_down_rounded
                              : Icons.keyboard_arrow_up_rounded,
                          size: 36),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 28),
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).width - 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ]),
                padding: const EdgeInsets.only(left: 28, right: 22),
                height: 72,
                child: Row(
                  children: [
                    Icon(Icons.emoji_events_outlined, size: 28),
                    SizedBox(width: 15),
                    Text(
                      '수상내역',
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(detail4Provider.notifier)
                            .setD(ref.watch(detail4Provider));
                      },
                      child: Icon(
                          ref.watch(detail4Provider) == false
                              ? Icons.keyboard_arrow_down_rounded
                              : Icons.keyboard_arrow_up_rounded,
                          size: 36),
                    )
                  ],
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}

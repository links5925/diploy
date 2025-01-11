import 'package:diploy/riverpod/addDetailPortfolio.dart';
import 'package:diploy/riverpod/image.dart';
import 'package:diploy/riverpod/nowDate.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailportfolioWrite extends ConsumerStatefulWidget {
  const DetailportfolioWrite({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailportfoliState();
}

class _DetailportfoliState extends ConsumerState<DetailportfolioWrite> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(addDetailProvider.notifier).setNull();
      ref.read(imagePickProvider.notifier).setNull();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController c1 = TextEditingController();
    TextEditingController c2 = TextEditingController();
    TextEditingController c3 = TextEditingController();
    TextEditingController c4 = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
            '${ref.watch(nowDateProvider).year}. ${ref.watch(nowDateProvider).month}. ${ref.watch(nowDateProvider).day}'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: MediaQuery.sizeOf(context).width,
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
                      spreadRadius: 0)
                ],
              ),
              height: 30,
              child: Container(
                alignment: Alignment.center,
                width: 300,
                child: TextField(
                    controller: c1,
                    textAlign: TextAlign.center,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: '제목을 입력해주세요',
                      border: InputBorder.none,
                    ),
                    cursorColor: Colors.transparent),
              ),
            ),
            const SizedBox(height: 3),
            GestureDetector(
              onTap: () {
                ref.read(imagePickProvider.notifier).setData();
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 300,
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.6)),
                child: ref.watch(imagePickProvider) == null
                    ? const Icon(Icons.image_not_supported_outlined, size: 48)
                    : Image(image: FileImage(ref.watch(imagePickProvider)!)),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 14, bottom: 14),
              width: MediaQuery.sizeOf(context).width - 90,
              decoration: ShapeDecoration(
                  color: const Color(0xFFD6ECF7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Q1. 오늘의 활동을 통해 무엇을 배웠나요?',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 3),
                  TextField(controller: c2)
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 14, bottom: 14),
              width: MediaQuery.sizeOf(context).width - 90,
              decoration: ShapeDecoration(
                  color: const Color(0xFFD6ECF7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Q2. 가장 기억에 남는 경험은 무엇인가요?',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 3),
                  TextField(controller: c3)
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 14, bottom: 14),
              width: MediaQuery.sizeOf(context).width - 90,
              decoration: ShapeDecoration(
                  color: const Color(0xFFD6ECF7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Q3. 어려웠던 점은 무엇이고, 어떻게 해결하였나요?',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 3),
                  TextField(controller: c4)
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 14, bottom: 14),
              width: MediaQuery.sizeOf(context).width - 90,
              decoration: ShapeDecoration(
                  color: const Color(0xFFD6ECF7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  )),
              child: Text('제출하기', style: const TextStyle(fontSize: 24)),
            )
          ],
        ),
      ),
    );
  }
}

class DetailPortfolioRead extends ConsumerStatefulWidget {
  const DetailPortfolioRead({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailPortfolioReadState();
}

class _DetailPortfolioReadState extends ConsumerState<DetailPortfolioRead> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
            '${ref.watch(nowDateProvider).year}. ${ref.watch(nowDateProvider).month}. ${ref.watch(nowDateProvider).day}'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: MediaQuery.sizeOf(context).width,
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
                      spreadRadius: 0)
                ],
              ),
              height: 30,
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.sizeOf(context).width,
                  child: const Text('something')),
            ),
            const SizedBox(height: 3),
            GestureDetector(
              onTap: () {
                ref.read(imagePickProvider.notifier).setData();
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 300,
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.6)),
                child: ref.watch(imagePickProvider) == null
                    ? const Icon(Icons.image_not_supported_outlined, size: 48)
                    : Image(image: FileImage(ref.watch(imagePickProvider)!)),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 14, bottom: 14),
              width: MediaQuery.sizeOf(context).width - 90,
              decoration: ShapeDecoration(
                  color: const Color(0xFFD6ECF7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Q1. 오늘의 활동을 통해 무엇을 배웠나요?',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    'A1. ~~',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 14, bottom: 14),
              width: MediaQuery.sizeOf(context).width - 90,
              decoration: ShapeDecoration(
                  color: const Color(0xFFD6ECF7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Q2. 가장 기억에 남는 경험은 무엇인가요?',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    'A2. ~~',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 14, bottom: 14),
              width: MediaQuery.sizeOf(context).width - 90,
              decoration: ShapeDecoration(
                  color: const Color(0xFFD6ECF7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Q3. 어려웠던 점은 무엇이고, 어떻게 해결하였나요?',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    'A3. ~~',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 14, bottom: 14),
              width: MediaQuery.sizeOf(context).width - 90,
              decoration: ShapeDecoration(
                  color: const Color(0xFFD6ECF7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  )),
              child: Text('제출하기', style: const TextStyle(fontSize: 24)),
            )
          ],
        ),
      ),
    );
  }
}

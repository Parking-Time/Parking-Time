import 'package:flutter/material.dart';

import '../../../presentation/resources/app_colors.dart';
import '../../../presentation/resources/assets.gen.dart';
import 'home_content.dart';
import 'app_bar_sliver_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlue1,
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: AppBarSliverDelegate(),
            ),
            SliverAppBar(
              floating: true,
              pinned: true,
              backgroundColor: kBlue1,
              collapsedHeight:90,
              toolbarHeight: 90,
              title: SizedBox(
                height: 100,
                child: Stack(
                  children: [
                    Container(
                      height: 100,
                      alignment: Alignment.center,
                      child: Container(
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: const BoxDecoration(color: kWhite, borderRadius: BorderRadius.all(Radius.circular(40))),
                        child: Row(
                          children: [
                            Assets.icons.bxSearch.svg(colorFilter: const ColorFilter.mode(kGray2, BlendMode.srcIn), height: 24, width: 24),
                            const SizedBox(width: 8),
                            Text(
                              '가고 싶은 곳을 검색해보세요',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: kGray2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(color: kWhite, borderRadius: BorderRadius.vertical(top: Radius.circular(14))),
                child: const HomeContent(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
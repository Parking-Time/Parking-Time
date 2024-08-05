import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../presentation/resources/app_colors.dart';
import '../../../presentation/resources/assets.gen.dart';
import '../../../presentation/router/app_router.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: _buildBottomNavigationBar,
    );
  }

  BottomNavigationBar get _buildBottomNavigationBar => BottomNavigationBar(
    showUnselectedLabels: false,
    showSelectedLabels: false,
    backgroundColor: kGray7,
    unselectedLabelStyle: const TextStyle(fontSize: 0, height: 0),
    selectedLabelStyle: const TextStyle(fontSize: 0, height: 0),
    type: BottomNavigationBarType.fixed,
    onTap: (index) => AppRouter.changeTab(tab: BaseTab.values[index]),
    currentIndex: AppRouter.currentTabIndex,
    items: [
      _buildBottomNavigationBarItem(
        label: '홈',
        iconBuilder: (isSelected) => Assets.icons.bxsHome.svg(colorFilter: ColorFilter.mode(isSelected ? kBlue1 : kGray2, BlendMode.srcIn)),
        isSelected: widget.navigationShell.currentIndex == 0,
        context: context,
      ),
      _buildBottomNavigationBarItem(
        label: '관심목록',
        iconBuilder: (isSelected) => Assets.icons.bxsHeart.svg(colorFilter: ColorFilter.mode(isSelected ? kBlue1 : kGray2, BlendMode.srcIn)),
        isSelected: widget.navigationShell.currentIndex == 1,
        context: context,
      ),
      _buildBottomNavigationBarItem(
        label: '프로필',
        iconBuilder: (isSelected) => Assets.icons.bxsUser.svg(colorFilter: ColorFilter.mode(isSelected ? kBlue1 : kGray2, BlendMode.srcIn)),
        isSelected: widget.navigationShell.currentIndex == 2,
        context: context,
      ),
    ],
  );

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required String label,
    required Widget Function(bool isSelected) iconBuilder,
    required bool isSelected,
    required BuildContext context,
  }) => BottomNavigationBarItem(
    icon: AnimatedCrossFade(
      crossFadeState: isSelected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 250),
      secondChild: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Column(
          children: [
            iconBuilder(false),
            const SizedBox(height: 5),
            Text(label, style: Theme.of(context).textTheme.labelSmall!.copyWith(color: kGray2)),
          ],
        ),
      ),
      firstChild: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Column(
          children: [
            iconBuilder(true),
            const SizedBox(height: 5),
            Text(label, style: Theme.of(context).textTheme.labelSmall!.copyWith(color: kBlue1)),
          ],
        ),
      ),
    ),
    label: label,
    backgroundColor: kTransparent,
  );
}

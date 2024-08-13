import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parking_time/presentation/resources/styles/colors.dart';

import '../../components/common/flux_image.dart';
import '../../providers/admin/admin_provider.dart';
import '../../resources/assets.gen.dart';

class ImageContent extends ConsumerWidget {
  const ImageContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parkingLot = ref.watch(adminProvider).parkingLot;
    final currentIndex = ref.watch(adminProvider).currentImageIndex;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            itemCount: parkingLot.images.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: FluxImage(imageUrl: parkingLot.images[index].imageUrl, fit: BoxFit.cover, width: double.infinity, height: 200),
            ),
            controller: PageController(viewportFraction: 0.99),
            onPageChanged: ref.read(adminProvider.notifier).setImageIndex,
          ),
        ),
        const SizedBox(height: 14),
        GestureDetector(
          onTap: () => ref.read(adminProvider.notifier).setMainImage(currentIndex),
          child: currentIndex == parkingLot.images.indexWhere((element) => element.isMainImage)
              ? Assets.icons.bxsChecked.svg(colorFilter: const ColorFilter.mode(kBlue1, BlendMode.srcIn))
              : Assets.icons.bxsUnchecked.svg(colorFilter: const ColorFilter.mode(kGray1, BlendMode.srcIn)),
        ),
      ],
    );
  }
}

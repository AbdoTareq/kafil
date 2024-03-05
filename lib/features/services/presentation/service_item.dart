import 'package:kafil/core/feature/data/models/services_wrapper.dart';
import 'package:kafil/core/view/widgets/old_fade_image.dart';

import '../../../export.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    super.key,
    required this.item,
  });

  final Service item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 151.w,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeImage(
              imagePath: item.mainImage,
              height: 103,
              width: 151,
            ).cornerRadius(8),
            8.r.heightBox,
            if (item.title != null)
              Text(
                item.title!,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.bodySmall,
              ).px8(),
            10.r.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.imagesStar),
                Text(
                  '(${item.averageRating})',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: kYellowColor),
                ).px4(),
                Text(
                  '|',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                4.w.widthBox,
                SvgPicture.asset(Assets.imagesServiceCart),
                Text('(${item.completedSalesCount})',
                        style: Theme.of(context).textTheme.bodySmall)
                    .px4(),
                18.r.heightBox,
              ],
            )
          ],
        ),
      ),
    );
  }
}

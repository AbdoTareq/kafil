import '../../../export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60.r),
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            if (context.router.canPop())
              InkWell(
                  onTap: () => context.popRoute(),
                  child: Icon(Icons.navigate_before, size: 26.h)),
            12.w.widthBox,
            title
                .tr()
                .text
                .gray900
                .fontWeight(FontWeight.w600)
                .size(18.sp)
                .make(),
          ],
        ).px12(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

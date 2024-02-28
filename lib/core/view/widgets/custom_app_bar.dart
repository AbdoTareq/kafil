import '../../../export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title
          .tr()
          .text
          .gray900
          .fontWeight(FontWeight.w600)
          .size(18.sp)
          .make(),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

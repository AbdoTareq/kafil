import '../../../export.dart';

class FadeImage extends StatelessWidget {
  const FadeImage({
    super.key,
    this.errorImagePath,
    this.imagePath,
    this.boxFit,
    this.width,
    this.height,
  });

  final String? errorImagePath;
  final String? imagePath;
  final double? width;
  final double? height;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
        placeholder: 'assets/images/loading.gif',
        image: imagePath ?? '',
        fit: boxFit ?? BoxFit.fill,
        imageErrorBuilder: (context, url, error) {
          return Container(
            height: height ?? 100,
            width: width ?? 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(errorImagePath ?? "assets/images/logo.png"),
                fit: boxFit ?? BoxFit.fill,
              ),
            ),
          );
        });
  }
}

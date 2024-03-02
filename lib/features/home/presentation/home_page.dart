import 'package:flutter_svg/svg.dart';
import 'package:kafil/assets.dart';
import 'package:kafil/core/app_router.dart';

import '../../../export.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        ProfileRoute(),
        CountriesRoute(),
        ServicesRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              label: whoAmI,
              icon: SvgPicture.asset(Assets.imagesProfile),
              activeIcon: SvgPicture.asset(
                Assets.imagesProfileSelected,
              ),
            ),
            BottomNavigationBarItem(
              label: countries,
              icon: SvgPicture.asset(Assets.imagesCountries),
              activeIcon: SvgPicture.asset(
                Assets.imagesCountriesSelected,
              ),
            ),
            BottomNavigationBarItem(
              label: services,
              icon: SvgPicture.asset(Assets.imagesCart),
              activeIcon: SvgPicture.asset(
                Assets.imagesServiceSelected,
              ),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kafil/features/auth/presentation/cubit.dart';
import 'package:kafil/features/auth/presentation/signup/basic_data_step.dart';
import 'package:kafil/features/auth/presentation/signup/complete_data_step.dart';

import '../../../../../export.dart';

@RoutePage()
class SignUpPage extends HookWidget {
  SignUpPage({super.key});
  final controller = sl<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    final step = useState(0);

    continued() {
      step.value < 1 ? step.value += 1 : null;
    }

    cancel() {
      step.value > 0 ? step.value -= 1 : null;
    }

    return Scaffold(
      backgroundColor: kBGGreyColor,
      appBar: CustomAppBar(title: signup.tr()),
      body: Stepper(
        type: StepperType.horizontal,
        physics: const ScrollPhysics(),
        currentStep: step.value,
        onStepTapped: (step) => cancel(),
        controlsBuilder: (context, controlDetails) => Container(),
        steps: <Step>[
          Step(
            title: signup.tr().text.bold.xl.make().p8(),
            content: BasicDataStep(continued: continued),
          ),
          Step(
            title: completeData.tr().text.bold.xl.make().p8(),
            content: CompleteDataStep(),
          ),
        ],
      ),
    );
  }
}

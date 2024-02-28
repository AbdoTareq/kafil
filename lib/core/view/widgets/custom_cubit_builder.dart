import '../../../export.dart';

class CustomCubitBuilder<T> extends StatelessWidget {
  const CustomCubitBuilder(
      {super.key,
      required this.cubit,
      required this.onSuccess,
      this.onLoading,
      this.onError,
      this.onEmpty});
  final Widget Function(BuildContext, BaseState<T>)? onLoading;
  final Widget Function(BuildContext, BaseState<T>)? onEmpty;
  final Widget Function(BuildContext, BaseState<T>)? onError;
  final Widget Function(BuildContext, BaseState<T>) onSuccess;
  final Cubit<BaseState<T>> cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Cubit<BaseState<T>>, BaseState<T>>(
        bloc: cubit,
        builder: (ctx, state) {
          switch (state.status) {
            case RxStatus.Loading:
              return onLoading != null
                  ? onLoading!(context, state)
                  : const Center(child: CircularProgressIndicator());
            case RxStatus.Error:
              return onError != null
                  ? onError!(context, state)
                  : Center(child: Text(state.errorMessage!));
            case RxStatus.Empty:
              return onEmpty != null
                  ? onEmpty!(context, state)
                  : const Center(child: Text('no data'));
            default:
              return onSuccess(context, state);
          }
        });
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import '../cache_helper.dart';
import 'dark_states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState()); // Emit state here for initial setup
    } else {
      isDark = !isDark;CacheHelper.putBooleanData(key: 'isDark',
          value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }
}
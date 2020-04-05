
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../repositories/preferences/preference_repository.dart';

import 'preferences_state.dart';
import 'preferences_event.dart';
export 'preferences_event.dart';
export 'preferences_state.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState>{

  final PreferencesRepository _preferencesRepository;

  PreferencesBloc({@required PreferencesRepository preferencesRepository})
    : assert(preferencesRepository != null),
    _preferencesRepository = preferencesRepository;

  @override
  PreferencesState get initialState => PreferencesNotLoaded();

  @override
  Stream<PreferencesState> mapEventToState(PreferencesEvent event) async*{
    if (event is LoadPreferences){
      yield* _mapLoadPreferencesToState();
    }else{
      yield* _mapUpdateThemeToState(event);
    }
  }

  Stream<PreferencesState> _mapUpdateThemeToState(UpdatePreferences event) async* {
    _preferencesRepository.setLoginState(event.isLoggedIn);
    yield PreferencesLoaded(isLoggidIn: event.isLoggedIn);
  }

  Stream<PreferencesState> _mapLoadPreferencesToState() async* {

    bool preferenceExist = _preferencesRepository.isInstanceConstainsKey();

    if (!preferenceExist){
      _preferencesRepository.setLoginState(false);
      add(UpdatePreferences(false));
      yield PreferencesLoaded(isLoggidIn: false);
    }else{
      bool savedPreferece = _preferencesRepository.getLoginState();
      yield PreferencesLoaded(isLoggidIn: savedPreferece);
    }
  }
}